const { Canvas, Image } = require('skia-canvas');
const fs = require('fs').promises;
const csv = require('csv-parser');
const ffmpeg = require('fluent-ffmpeg');
const { createReadStream } = require('fs');
const path = require('path');

const width = 640;
const height = 480;

const canvas = new Canvas(width, height);
const ctx = canvas.getContext('2d');

const fontSize = 18;
ctx.font = `${fontSize}px Arial`;
const smallFont = '12px Arial';

function parseVal(s) {
    return parseInt(s, 16);
}


function drawDramIf(data) {
    const x0 = 460;
    const y0 = 360;
    const w = 40;
    const h = 40;
    
    ctx.strokeStyle = 'white';
    ctx.strokeRect(x0, y0, w, h);
    
    ctx.fillStyle = 'white';
    ctx.fillText('DRAM', x0 - 10, y0 + 45);
    
    const state = parseVal(data["DRAM_IF_STATE"]);
    let stateS = "P";
    if (state === 1) stateS = "I";
    else if (state === 2) stateS = "D";
    else if (state === 3) stateS = "W";
    
    ctx.fillText(stateS, x0 + 15, y0 + 26);

    if (parseVal(data["DRAM_IF_INS_IN_VALID"])) {
        ctx.font = smallFont;
        ctx.fillText('I', x0 + 5, y0 + 15);
        ctx.font = '18px Arial';
    }

    const counter = parseVal(data["DRAM_IF_BURST_COUNTER"]);
    ctx.font = smallFont;
    ctx.fillText(counter.toString(), x0 + 25, y0 - 5);

    const fifoLength = parseVal(data["DRAM_IF_FIFO_LENGTH"]);
    ctx.fillText(fifoLength.toString(), x0, y0 - 5);
    ctx.font = '18px Arial';
}

function drawPcieIf(data) {
    const x0 = 520;
    const y0 = 360;
    const w = 40;
    const h = 40;
    
    ctx.strokeStyle = 'white';
    ctx.strokeRect(x0, y0, w, h);
    
    ctx.fillStyle = 'white';
    ctx.fillText('PCIE', x0, y0 + 45);

    let stateS = "";
    const rxState = parseVal(data["PCIE0_IF_RX_STATE"]);
    const rxTvalid = parseVal(data["PCIE0_IF_RX_TVALID"] || "0");
    
    if (rxState === 0 && rxTvalid) stateS += "I";
    else if (rxState === 1) stateS += "R";
    else if (rxState === 2) stateS += "N";
    
    const txState = parseVal(data["PCIE0_IF_TX_STATE"]);
    if (txState === 1) stateS += "W";
    
    ctx.fillText(stateS, x0 + 10, y0 + 26);

    const rxLen = parseVal(data["PCIE0_IF_RX_LEN"]);
    ctx.font = smallFont;
    ctx.fillText(rxLen.toString(), x0, y0 - 5);

    const txLen = parseVal(data["PCIE0_IF_TX_LEN"]);
    ctx.fillText(txLen.toString(), x0 + 25, y0 - 5);
    ctx.font = '18px Arial';
}

function drawSwId(data) {
    const x0 = 400;
    const y0 = 360;
    const w = 40;
    const h = 40;
    
    ctx.strokeStyle = 'white';
    ctx.strokeRect(x0, y0, w, h);
    
    ctx.fillStyle = 'white';
    ctx.fillText('S', x0 + 10, y0 + 45);

    if (parseVal(data["SW_ID_INS_IN_VALID"])) {
        ctx.font = smallFont;
        ctx.fillText('I', x0 + 5, y0 + 15);
        ctx.font = '18px Arial';
    }
}

function drawSwSlice(data) {
    const x0 = 400;
    const y0 = 260;
    const w = 40;
    const h = 40;

    for (let i = 0; i < 4; i++) {
        ctx.strokeStyle = 'white';
        ctx.strokeRect(x0, y0 - i * 80, w + 1, 2 * h + 1);

        if (parseVal(data[`SW_TILE_${i}_INS_IN_VALID`])) {
            ctx.font = smallFont;
            ctx.fillText('I', x0 + 5, y0 - i * 80 + 15);
        }

        if (parseVal(data["SW_SLICE_DATA_IN_VALID"])) {
            ctx.font = smallFont;
            ctx.fillText('D', x0 + 30, y0 - i * 80 + 15);
        }

        if (parseVal(data[`SW_TILE_${i}_STREAM_IN_VALID`])) {
            ctx.font = smallFont;
            ctx.fillText('S', x0 + 10, y0 - i * 80 + 15);
        }

        const state = parseVal(data[`SW_TILE_${i}_STATE`]);
        let stateS = "P";
        if (state === 1) stateS = "I";
        else if (state === 2) stateS = "O";

        ctx.font = '18px Arial';
        ctx.fillText(stateS, x0 + 15, y0 - i * 80 + 45);
    }
}

function drawMem1Id(data) {
    const x0 = 350;
    const y0 = 360;
    const w = 40;
    const h = 40;
    
    ctx.strokeStyle = 'white';
    ctx.strokeRect(x0, y0, w, h);
    
    ctx.fillStyle = 'white';
    ctx.fillText('M1', x0 + 5, y0 + 45);

    if (parseVal(data["MEM1_ID_INS_IN_VALID"])) {
        ctx.font = smallFont;
        ctx.fillText('I', x0 + 5, y0 + 15);
        ctx.font = '18px Arial';
    }
}

function drawMem1Slice(data) {
    const x0 = 350;
    const y0 = 300;
    const w = 40;
    const h = 40;

    for (let i = 0; i < 4; i++) {
        ctx.strokeStyle = 'white';
        ctx.strokeRect(x0, y0 - i * 80, w + 1, h + 1);

        if (parseVal(data[`MEM1_TILE_W_${i}_INS_IN_VALID`])) {
            ctx.font = smallFont;
            ctx.fillText('I', x0 + 5, y0 - i * 80 + 15);
        }

        if (parseVal(data[`MEM1_TILE_W_${i}_STREAM_IN_VALID`])) {
            ctx.font = smallFont;
            ctx.fillText('D', x0 + 30, y0 - i * 80 + 15);
        }

        const state = parseVal(data[`MEM1_TILE_W_${i}_STATE`]);
        let stateS = "P";
        if (state === 1) stateS = "R";
        else if (state === 2) stateS = "W";

        ctx.font = '18px Arial';
        ctx.fillText(stateS, x0 + 15, y0 - i * 80 + 30);

        if (stateS === "R" || stateS === "W") {
            const dataLen = parseVal(data[`MEM1_TILE_W_${i}_LEN`]);
            ctx.font = smallFont;
            ctx.fillText(dataLen.toString(), x0 + 25, y0 - i * 80 + 45);
        }

        ctx.strokeRect(x0, y0 - i * 80 - 40, w + 1, h + 1);

        if (parseVal(data[`MEM1_TILE_E_${i}_INS_IN_VALID`])) {
            ctx.font = smallFont;
            ctx.fillText('I', x0 + 5, y0 - i * 80 - 25);
        }

        if (parseVal(data[`MEM1_TILE_E_${i}_STREAM_IN_VALID`])) {
            ctx.font = smallFont;
            ctx.fillText('D', x0 + 30, y0 - i * 80 - 25);
        }

        const stateE = parseVal(data[`MEM1_TILE_E_${i}_STATE`]);
        let stateSE = "P";
        if (stateE === 1) stateSE = "R";
        else if (stateE === 2) stateSE = "W";

        ctx.font = '18px Arial';
        ctx.fillText(stateSE, x0 + 15, y0 - i * 80 - 10);

        if (stateSE === "R" || stateSE === "W") {
            const dataLenE = parseVal(data[`MEM1_TILE_E_${i}_LEN`]);
            ctx.font = smallFont;
            ctx.fillText(dataLenE.toString(), x0 + 25, y0 - i * 80 + 5);
        }
    }
}

function drawMem2Id(data) {
    const x0 = 300;
    const y0 = 360;
    const w = 40;
    const h = 40;
    
    ctx.strokeStyle = 'white';
    ctx.strokeRect(x0, y0, w, h);
    
    ctx.fillStyle = 'white';
    ctx.fillText('M2', x0 + 5, y0 + 45);

    if (parseVal(data["MEM2_ID_INS_IN_VALID"])) {
        ctx.font = smallFont;
        ctx.fillText('I', x0 + 5, y0 + 15);
        ctx.font = '18px Arial';
    }
}

function drawMem2Slice(data) {
    const x0 = 300;
    const y0 = 300;
    const w = 40;
    const h = 40;

    for (let i = 0; i < 4; i++) {
        ctx.strokeStyle = 'white';
        ctx.strokeRect(x0, y0 - i * 80, w + 1, h + 1);

        if (parseVal(data[`MEM2_TILE_W_${i}_INS_IN_VALID`])) {
            ctx.font = smallFont;
            ctx.fillText('I', x0 + 5, y0 - i * 80 + 15);
        }

        if (parseVal(data[`MEM2_TILE_W_${i}_STREAM_IN_VALID`])) {
            ctx.font = smallFont;
            ctx.fillText('D', x0 + 30, y0 - i * 80 + 15);
        }

        const state = parseVal(data[`MEM2_TILE_W_${i}_STATE`]);
        let stateS = "P";
        if (state === 1) stateS = "R";
        else if (state === 2) stateS = "W";

        ctx.font = '18px Arial';
        ctx.fillText(stateS, x0 + 15, y0 - i * 80 + 30);

        if (stateS === "R" || stateS === "W") {
            const dataLen = parseVal(data[`MEM2_TILE_W_${i}_LEN`]);
            ctx.font = smallFont;
            ctx.fillText(dataLen.toString(), x0 + 25, y0 - i * 80 + 45);
        }

        ctx.strokeRect(x0, y0 - i * 80 - 40, w + 1, h + 1);

        if (parseVal(data[`MEM2_TILE_E_${i}_INS_IN_VALID`])) {
            ctx.font = smallFont;
            ctx.fillText('I', x0 + 5, y0 - i * 80 - 25);
        }

        if (parseVal(data[`MEM2_TILE_E_${i}_STREAM_IN_VALID`])) {
            ctx.font = smallFont;
            ctx.fillText('D', x0 + 30, y0 - i * 80 - 25);
        }

        const stateE = parseVal(data[`MEM2_TILE_E_${i}_STATE`]);
        let stateSE = "P";
        if (stateE === 1) stateSE = "R";
        else if (stateE === 2) stateSE = "W";

        ctx.font = '18px Arial';
        ctx.fillText(stateSE, x0 + 15, y0 - i * 80 - 10);

        if (stateSE === "R" || stateSE === "W") {
            const dataLenE = parseVal(data[`MEM2_TILE_E_${i}_LEN`]);
            ctx.font = smallFont;
            ctx.fillText(dataLenE.toString(), x0 + 25, y0 - i * 80 + 5);
        }
    }
}

function drawVecId(data) {
    const x0 = 250;
    const y0 = 360;
    const w = 40;
    const h = 40;
    
    ctx.strokeStyle = 'white';
    ctx.strokeRect(x0, y0, w, h);
    
    ctx.fillStyle = 'white';
    ctx.fillText('V', x0 + 10, y0 + 45);

    if (parseVal(data["VEC_ID_INS_IN_VALID"])) {
        ctx.font = smallFont;
        ctx.fillText('I', x0 + 5, y0 + 15);
        ctx.font = '18px Arial';
    }
}

function drawVecSlice(data) {
    const x0 = 250;
    const y0 = 260;
    const w = 40;
    const h = 40;

    for (let i = 0; i < 4; i++) {
        ctx.strokeStyle = 'white';
        ctx.strokeRect(x0, y0 - i * 80, w + 1, 2 * h + 1);

        if (parseVal(data[`VEC_TILE_${i}_INS_IN_VALID`])) {
            ctx.font = smallFont;
			ctx.fillText('I', x0 + 5, y0 - i * 80 + 15);
        }

        if (parseVal(data[`VEC_TILE_${i}_STREAM_IN_VALID_W`]) || parseVal(data[`VEC_TILE_${i}_STREAM_IN_VALID_E`])) {
            let dataS = "D";
            if (parseVal(data[`VEC_TILE_${i}_STREAM_IN_VALID_W`]) && parseVal(data[`VEC_TILE_${i}_STREAM_IN_VALID_E`])) {
                dataS += "-";
            } else if (parseVal(data[`VEC_TILE_${i}_STREAM_IN_VALID_W`])) {
                dataS += "<";
            } else if (parseVal(data[`VEC_TILE_${i}_STREAM_IN_VALID_E`])) {
                dataS += ">";
            }
            ctx.font = smallFont;
            ctx.fillText(dataS, x0 + 20, y0 - i * 80 + 15);
        }

        const state = parseVal(data[`VEC_TILE_${i}_STATE`]);
        let stateS = "P";
        if (state === 1) stateS = "L";
        else if (state === 2) stateS = "A";
        else if (state === 3) stateS = "R";

        ctx.font = '18px Arial';
        ctx.fillText(stateS, x0 + 15, y0 - i * 80 + 45);
    }
}

function drawDot1Id(data) {
    const x0 = 200;
    const y0 = 360;
    const w = 40;
    const h = 40;
    
    ctx.strokeStyle = 'white';
    ctx.strokeRect(x0, y0, w, h);
    
    ctx.fillStyle = 'white';
    ctx.fillText('D1', x0 + 10, y0 + 45);

    if (parseVal(data["DOT1_ID_INS_IN_VALID"])) {
        ctx.font = smallFont;
        ctx.fillText('I', x0 + 5, y0 + 15);
        ctx.font = '18px Arial';
    }
}

function drawDot1Slice(data) {
    const x0 = 200;
    const y0 = 260;
    const w = 40;
    const h = 40;

    for (let i = 0; i < 4; i++) {
        ctx.strokeStyle = 'white';
        ctx.strokeRect(x0, y0 - i * 80, w + 1, 2 * h + 1);

        if (parseVal(data[`DOT1_TILE_${i}_INS_IN_VALID`])) {
            ctx.font = smallFont;
            ctx.fillText('I', x0 + 5, y0 - i * 80 + 15);
        }

        if (parseVal(data[`DOT1_TILE_${i}_STREAM_IN_VALID_W`])) {
            ctx.font = smallFont;
            ctx.fillText('D', x0 + 20, y0 - i * 80 + 15);
        }

        const state = parseVal(data[`DOT1_TILE_${i}_STATE`]);
        let stateS = "P";
        if (state === 1) stateS = "L";
        else if (state === 2) stateS = "M";
        else if (state === 3) stateS = "R";

        ctx.font = '18px Arial';
        ctx.fillText(stateS, x0 + 15, y0 - i * 80 + 45);
    }
}

function drawDot2Id(data) {
    const x0 = 150;
    const y0 = 360;
    const w = 40;
    const h = 40;
    
    ctx.strokeStyle = 'white';
    ctx.strokeRect(x0, y0, w, h);
    
    ctx.fillStyle = 'white';
    ctx.fillText('D2', x0 + 10, y0 + 45);

    if (parseVal(data["DOT2_ID_INS_IN_VALID"])) {
        ctx.font = smallFont;
        ctx.fillText('I', x0 + 5, y0 + 15);
        ctx.font = '18px Arial';
    }
}

function drawDot2Slice(data) {
    const x0 = 150;
    const y0 = 260;
    const w = 40;
    const h = 40;

    for (let i = 0; i < 4; i++) {
        ctx.strokeStyle = 'white';
        ctx.strokeRect(x0, y0 - i * 80, w + 1, 2 * h + 1);

        if (parseVal(data[`DOT2_TILE_${i}_INS_IN_VALID`])) {
            ctx.font = smallFont;
            ctx.fillText('I', x0 + 5, y0 - i * 80 + 15);
        }

        if (parseVal(data[`DOT2_TILE_${i}_STREAM_IN_VALID_W`])) {
            ctx.font = smallFont;
            ctx.fillText('D', x0 + 20, y0 - i * 80 + 15);
        }

        const state = parseVal(data[`DOT2_TILE_${i}_STATE`]);
        let stateS = "P";
        if (state === 1) stateS = "L";
        else if (state === 2) stateS = "M";
        else if (state === 3) stateS = "R";

        ctx.font = '18px Arial';
        ctx.fillText(stateS, x0 + 15, y0 - i * 80 + 45);
    }
}

function drawScene(data) {
    ctx.fillStyle = 'black';
    ctx.fillRect(0, 0, width, height);

    drawDramIf(data);
    drawPcieIf(data);
    drawSwId(data);
    drawSwSlice(data);
    drawMem1Id(data);
    drawMem1Slice(data);
    drawMem2Id(data);
    drawMem2Slice(data);
    drawVecId(data);
    drawVecSlice(data);
    drawDot1Id(data);
    drawDot1Slice(data);
    drawDot2Id(data);
    drawDot2Slice(data);

    ctx.fillStyle = 'white';
    ctx.fillText(`t=${parseFloat(data["Time"])} ns`, 10, 30);
}


async function processCSV() {
    return new Promise((resolve, reject) => {
        const frames = [];
        createReadStream('states.csv')
            .pipe(csv())
            .on('data', (row) => {
                const states = Object.fromEntries(
                    Object.entries(row).map(([k, v]) => [k.trim(), v.trim()])
                );
                frames.push(states);
            })
            .on('end', () => {
                console.log('CSV file successfully processed');
                resolve(frames);
            })
            .on('error', reject);
    });
}

async function generateFrames(frames) {
    const tempDir = path.join(__dirname, 'temp_frames');
    await fs.mkdir(tempDir, { recursive: true });

    for (let i = 0; i < frames.length; i++) {
        drawScene(frames[i]);
        const buffer = await canvas.toBuffer('png');  // Added await here
        await fs.writeFile(path.join(tempDir, `frame_${i.toString().padStart(5, '0')}.png`), buffer);
        console.log(`Processed frame ${i + 1}/${frames.length}`);
    }

    return tempDir;
}

async function createVideo(framesDir) {
    return new Promise((resolve, reject) => {
        ffmpeg()
            .input(path.join(framesDir, 'frame_%05d.png'))
            .inputFPS(2)
            .output('simulation.mp4')
            .outputOptions(['-pix_fmt yuv420p', '-r 2'])  // Added output frame rate
            .on('end', () => {
                console.log('Video processing finished');
                resolve();
            })
            .on('error', (err) => {
                console.error('Error: ', err);
                reject(err);
            })
            .run();
    });
}

async function cleanup(tempDir) {
    const files = await fs.readdir(tempDir);
    for (const file of files) {
        await fs.unlink(path.join(tempDir, file));
    }
    await fs.rmdir(tempDir);
    console.log('Temporary files cleaned up');
}

async function main() {
    try {
        const frames = await processCSV();
        const tempDir = await generateFrames(frames);
        await createVideo(tempDir);
        await cleanup(tempDir);
    } catch (error) {
        console.error('An error occurred:', error);
    }
}

main();
