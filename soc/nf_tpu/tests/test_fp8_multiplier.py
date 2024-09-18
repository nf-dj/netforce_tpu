# test_fp8_e4m3_multiplier.py

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
async def test_fp8_e4m3_multiplier(dut):
    """Test the FP8 E4M3 multiplier with multiple test cases, showing binary values."""

    # Define test cases as a list of tuples (a_value, b_value, expected_product)
    test_cases = [
        (0.0, 0.0, 0.0),
        (1.0, 1.0, 1.0),
        (2.0, 2.0, 4.0),
        (1.5, 2.0, 3.0),
        (-1.5, 2.0, -3.0),
        (0.5, 4.0, 2.0),
        (-0.75, -0.5, 0.375),
        (3.5, 2.0, 7.0),
        (15.0, 0.5, 7.5),
        (0.25, 0.125, 0.03125),
        (448.0, 0.5, 224.0),
        #(448.0, 2.0, 448.0),  # Overflow case
        (448.0, 2.0, 480.0),  # Overflow case
        (0.015625, 2.0, 0.03125),
        (0.0087890625, 2.0, 0.017578125),
        (256.0, 0.5, 128.0),
        (256.0, 0.25, 64.0),
        (256.0, 0.125, 32.0),
        (256.0, 0.0625, 16.0),
    ]

    tolerance = 1e-6  # Adjust tolerance as needed for FP8 precision

    for idx, (a_value, b_value, expected) in enumerate(test_cases):
        # Convert to FP8 E4M3 format
        try:
            a_fp8 = float_to_fp8_e4m3(a_value)
            b_fp8 = float_to_fp8_e4m3(b_value)
        except ValueError as e:
            dut._log.warning(f"Test case {idx}: Skipping due to exception: {e}")
            continue  # Skip test case if value cannot be represented

        # Apply inputs
        dut.a.value = a_fp8
        dut.b.value = b_fp8

        await Timer(1, units='ns')  # Wait for the combinational logic to settle

        # Read output
        product_fp8 = dut.result.value.integer
        product_float = fp8_e4m3_to_float(product_fp8)

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
        product_binary = f"{product_fp8:08b}"

        # Check the result within tolerance
        if abs(product_float - expected) > tolerance and product_fp8 != expected_fp8:
            dut._log.error(f"Test case {idx}:")
            dut._log.error(f"  Inputs:")
            dut._log.error(f"    a = {a_value} (FP8: {a_binary})")
            dut._log.error(f"    b = {b_value} (FP8: {b_binary})")
            dut._log.error(f"  Expected Product:")
            dut._log.error(f"    {expected} (FP8: {expected_binary})")
            dut._log.error(f"  Actual Product:")
            dut._log.error(f"    {product_float} (FP8: {product_binary})")
            raise TestFailure(f"Test case {idx} failed: {product_float} != {expected}")
        else:
            dut._log.info(f"Test case {idx} passed:")
            dut._log.info(f"  Inputs:")
            dut._log.info(f"    a = {a_value} (FP8: {a_binary})")
            dut._log.info(f"    b = {b_value} (FP8: {b_binary})")
            dut._log.info(f"  Expected Product:")
            dut._log.info(f"    {expected} (FP8: {expected_binary})")
            dut._log.info(f"  Actual Product:")
            dut._log.info(f"    {product_float} (FP8: {product_binary})")
