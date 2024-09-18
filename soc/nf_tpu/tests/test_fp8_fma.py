# test_fp8_e4m3_fma.py

import cocotb
from cocotb.triggers import Timer
from cocotb.result import TestFailure
import math

def float_to_fp8_e4m3(value):
    """Convert a Python float to FP8 E4M3 format."""
    if value == 0:
        return 0

    sign = 0 if value >= 0 else 1
    value = abs(value)

    exponent = int(math.floor(math.log2(value)))
    exponent_bias = exponent + 7  # Bias of -7

    if exponent_bias < 0 or exponent_bias > 15:
        raise ValueError(f"Exponent {exponent} out of range for FP8 E4M3.")

    # Compute fraction
    mantissa = (value / (2 ** exponent)) - 1
    mantissa = int(round(mantissa * 8))  # Scale to 3 bits

    if mantissa >= 8:
        mantissa = 7  # Max value for 3 bits

    fp8_value = (sign << 7) | (exponent_bias << 3) | mantissa
    return fp8_value

def fp8_e4m3_to_float(fp8_value):
    """Convert FP8 E4M3 format to Python float."""
    sign = (fp8_value >> 7) & 0x1
    exponent_bias = (fp8_value >> 3) & 0xF
    mantissa = fp8_value & 0x7

    if exponent_bias == 0 and mantissa == 0:
        return -0.0 if sign else 0.0
    else:
        exponent = exponent_bias - 7  # Bias of -7
        fraction = mantissa / 8.0  # 3 bits for fraction
        value = (1 + fraction) * (2 ** exponent)

    if sign == 1:
        value = -value
    return value

@cocotb.test()
async def test_fp8_e4m3_fma(dut):
    """Test the FP8 E4M3 FMA with multiple test cases, showing binary values."""

    # Define test cases as a list of tuples (a_value, b_value, c_value, expected_result)
    test_cases = [
        (1.0, 1.0, 1.0, 2.0),        # Simple case: 1 * 1 + 1 = 2
        (2.0, 2.0, 1.0, 5.0),        # 2 * 2 + 1 = 5
        (1.5, 2.0, -1.0, 2.0),       # 1.5 * 2 - 1 = 2
        (0.5, 4.0, 1.0, 3.0),        # 0.5 * 4 + 1 = 3
        (-0.75, -0.5, 0.375, 0.75),  # (-0.75) * (-0.5) + 0.375 = 0.75
        (15.0, 0.5, -7.0, 0.5),      # 15 * 0.5 - 7 = 0.5
        (448.0, 0.5, 1.0, 225.0),    # 448 * 0.5 + 1 = 225
        (448.0, 1.0, 1.0, 448.0),    # 448 * 1 + 1 = 448
        (480.0, 1.0, 1.0, 480.0),    # 448 * 1 + 1 = 448
        (480.0, -1.0, 0.0, -480.0), 
        (480.0, -1.0, -1.0, -480.0), 
        (448.0, -1.0, -1.0, -448.0), 
        (480.0, -1.0, 480, 0), 
        (0.0087890625, 2.0, 0.0, 0.017578125),  # Small number case
        (256.0, 0.5, -128.0, 0.0),   # Exact cancellation
        (1.0, -1.0, 1.0, 0.0),       # Another cancellation case
        (448.0, -1.0, 448.0, 0.0),   # Large number cancellation
        (0.015625, 0.5, 0, 0),  # Small number addition
        (0.03125, 0.5, 0, 0.015625),
    ]

    tolerance = 1e-6  # Adjust tolerance as needed for FP8 precision

    for idx, (a_value, b_value, c_value, expected) in enumerate(test_cases):
        # Convert to FP8 E4M3 format
        try:
            a_fp8 = float_to_fp8_e4m3(a_value)
            b_fp8 = float_to_fp8_e4m3(b_value)
            c_fp8 = float_to_fp8_e4m3(c_value)
        except ValueError as e:
            dut._log.warning(f"Test case {idx}: Skipping due to exception: {e}")
            continue  # Skip test case if value cannot be represented

        # Apply inputs
        dut.a.value = a_fp8
        dut.b.value = b_fp8
        dut.c.value = c_fp8

        await Timer(1, units='ns')  # Wait for the combinational logic to settle

        # Read output
        result_fp8 = dut.result.value.integer
        result_float = fp8_e4m3_to_float(result_fp8)

        # Expected result
        # Handle cases where expected is out of representable range
        try:
            expected_fp8 = float_to_fp8_e4m3(expected)
            expected_binary = f"{expected_fp8:08b}"
        except ValueError:
            expected_binary = "XXXXXXXX"  # Indicate overflow or invalid
            expected_fp8 = float_to_fp8_e4m3(448.0)  # Max representable value

        # Prepare binary representations
        a_binary = f"{a_fp8:08b}"
        b_binary = f"{b_fp8:08b}"
        c_binary = f"{c_fp8:08b}"
        result_binary = f"{result_fp8:08b}"

        # Check the result within tolerance
        if abs(result_float - expected) > tolerance and result_fp8 != expected_fp8:
            dut._log.error(f"Test case {idx}:")
            dut._log.error(f"  Inputs:")
            dut._log.error(f"    a = {a_value} (FP8: {a_binary})")
            dut._log.error(f"    b = {b_value} (FP8: {b_binary})")
            dut._log.error(f"    c = {c_value} (FP8: {c_binary})")
            dut._log.error(f"  Expected Result:")
            dut._log.error(f"    {expected} (FP8: {expected_binary})")
            dut._log.error(f"  Actual Result:")
            dut._log.error(f"    {result_float} (FP8: {result_binary})")
            raise TestFailure(f"Test case {idx} failed: {result_float} != {expected}")
        else:
            dut._log.info(f"Test case {idx} passed:")
            dut._log.info(f"  Inputs:")
            dut._log.info(f"    a = {a_value} (FP8: {a_binary})")
            dut._log.info(f"    b = {b_value} (FP8: {b_binary})")
            dut._log.info(f"    c = {c_value} (FP8: {c_binary})")
            dut._log.info(f"  Expected Result:")
            dut._log.info(f"    {expected} (FP8: {expected_binary})")
            dut._log.info(f"  Actual Result:")
            dut._log.info(f"    {result_float} (FP8: {result_binary})")
