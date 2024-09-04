#!/usr/bin/env python3

import pygame
import sys
import csv
import time

pygame.init()

screen_width, screen_height = 640, 480
screen = pygame.display.set_mode((screen_width, screen_height))
pygame.display.set_caption('NPUSim')

font_size = 18
font = pygame.font.SysFont('Arial', font_size)

font_small = pygame.font.SysFont('Arial', 12)

def parse_val(s):
    v=int(s,16)
    return v

def draw_dram_if(data):
    x0=460
    y0=350+10
    w=40
    h=40
    pygame.draw.rect(screen, (255,255,255), (x0, y0, w, h), 2)
    text = font.render('DRAM', True, (255,255,255))
    screen.blit(text, (x0-10, y0+45))
    state=parse_val(data["DRAM_IF_STATE"])
    if state==0:
        state_s="P"
    elif state==1:
        state_s="I"
    elif state==2:
        state_s="D"
    elif state==3:
        state_s="W"
    text = font.render(state_s, True, (255,255,255))
    screen.blit(text, (x0+15, y0+8))

    if parse_val(data["DRAM_IF_INS_IN_VALID"]):
        text = font_small.render('I', True, (255,255,255))
        screen.blit(text, (x0+5, y0+5))

    counter=parse_val(data["DRAM_IF_BURST_COUNTER"])
    text = font_small.render(str(counter), True, (255,255,255))
    screen.blit(text, (x0+25, y0-15))

    counter=parse_val(data["DRAM_IF_FIFO_LENGTH"])
    text = font_small.render(str(counter), True, (255,255,255))
    screen.blit(text, (x0, y0-15))

def draw_pcie_if(data):
    x0=520
    y0=350+10
    w=40
    h=40
    pygame.draw.rect(screen, (255,255,255), (x0, y0, w, h), 2)
    text = font.render('PCIE', True, (255,255,255))
    screen.blit(text, (x0, y0+45))

    state_s=""
    rx_state=parse_val(data["PCIE0_IF_RX_STATE"])
    try:
        rx_tvalid=parse_val(data["PCIE0_IF_RX_TVALID"])
    except:
        rx_tvalid=0
    if rx_state==0:
        if rx_tvalid:
            state_s+="I"
    elif rx_state==1:
        state_s+="R"
    elif rx_state==2:
        state_s+="N"
    tx_state=parse_val(data["PCIE0_IF_TX_STATE"])
    if tx_state==1:
        state_s+="W"
    text = font.render(state_s, True, (255,255,255))
    screen.blit(text, (x0+10, y0+8))

    rx_len=parse_val(data["PCIE0_IF_RX_LEN"])
    text = font_small.render(str(rx_len), True, (255,255,255))
    screen.blit(text, (x0, y0-15))

    tx_len=parse_val(data["PCIE0_IF_TX_LEN"])
    text = font_small.render(str(tx_len), True, (255,255,255))
    screen.blit(text, (x0+25, y0-15))

def draw_sw_id(data):
    x0=400
    y0=350+10
    w=40
    h=40
    pygame.draw.rect(screen, (255,255,255), (x0, y0, w, h), 2)
    text = font.render('S', True, (255,255,255))
    screen.blit(text, (x0+10, y0+45))
    if parse_val(data["SW_ID_INS_IN_VALID"]):
        text = font_small.render('I', True, (255,255,255))
        screen.blit(text, (x0+5, y0+5))
    #fifo_len=parse_val(data["SW_ID_FIFO_LENGTH"])
    #text = font_small.render(str(fifo_len), True, (255,255,255))
    #screen.blit(text, (x0, y0-15))

def draw_sw_slice(data):
    x0=400
    y0=260
    w=40
    h=40
    for i in range(4):
        pygame.draw.rect(screen, (255,255,255), (x0, y0-i*80, w+1, 2*h+1), 2)

        if parse_val(data["SW_TILE_%s_INS_IN_VALID"%i]):
            text = font_small.render('I', True, (255,255,255))
            screen.blit(text, (x0+5, y0-i*80+5))

        if parse_val(data["SW_SLICE_DATA_IN_VALID"]):
            text = font_small.render('D', True, (255,255,255))
            screen.blit(text, (x0+30, y0-i*80+5))

        if parse_val(data["SW_TILE_%s_STREAM_IN_VALID"%i]):
            text = font_small.render('S', True, (255,255,255))
            screen.blit(text, (x0+10, y0-i*80+5))

        state=parse_val(data["SW_TILE_%s_STATE"%i])
        if state==0:
            state_s="P"
        elif state==1:
            state_s="I"
        elif state==2:
            state_s="O"
        text = font.render(state_s, True, (255,255,255))
        screen.blit(text, (x0+15, y0-i*80+25))

def draw_mem1_id(data):
    x0=350
    y0=350+10
    w=40
    h=40
    pygame.draw.rect(screen, (255,255,255), (x0, y0, w, h), 2)
    text = font.render('M1', True, (255,255,255))
    screen.blit(text, (x0+5, y0+45))
    if parse_val(data["MEM1_ID_INS_IN_VALID"]):
        text = font_small.render('I', True, (255,255,255))
        screen.blit(text, (x0+5, y0+5))
    #fifo_len=parse_val(data["MEM1_ID_FIFO_LENGTH_W"])
    #text = font_small.render(str(fifo_len), True, (255,255,255))
    #screen.blit(text, (x0, y0-15))

def draw_mem1_slice(data):
    x0=350
    y0=300
    w=40
    h=40
    for i in range(4):
        pygame.draw.rect(screen, (255,255,255), (x0, y0-i*80, w+1, h+1), 2)

        if parse_val(data["MEM1_TILE_W_%s_INS_IN_VALID"%i]):
            text = font_small.render('I', True, (255,255,255))
            screen.blit(text, (x0+5, y0-i*80+5))

        if parse_val(data["MEM1_TILE_W_%s_STREAM_IN_VALID"%i]):
            text = font_small.render('D', True, (255,255,255))
            screen.blit(text, (x0+30, y0-i*80+5))

        state=parse_val(data["MEM1_TILE_W_%s_STATE"%i])
        if state==0:
            state_s="P"
        elif state==1:
            state_s="R"
        elif state==2:
            state_s="W"
        text = font.render(state_s, True, (255,255,255))
        screen.blit(text, (x0+15, y0-i*80+10))

        if state_s in ("R","W"):
            data_len=parse_val(data["MEM1_TILE_W_%s_LEN"%i])
            text = font_small.render(str(data_len), True, (255,255,255))
            screen.blit(text, (x0+25, y0-i*80+25))

        pygame.draw.rect(screen, (255,255,255), (x0, y0-i*80-40, w+1, h+1), 2)

        if parse_val(data["MEM1_TILE_E_%s_INS_IN_VALID"%i]):
            text = font_small.render('I', True, (255,255,255))
            screen.blit(text, (x0+5, y0-i*80-40+5))

        if parse_val(data["MEM1_TILE_E_%s_STREAM_IN_VALID"%i]):
            text = font_small.render('D', True, (255,255,255))
            screen.blit(text, (x0+30, y0-i*80-40+5))

        state=parse_val(data["MEM1_TILE_E_%s_STATE"%i])
        if state==0:
            state_s="P"
        elif state==1:
            state_s="R"
        elif state==2:
            state_s="W"
        text = font.render(state_s, True, (255,255,255))
        screen.blit(text, (x0+15, y0-i*80-40+10))

        if state_s in ("R","W"):
            data_len=parse_val(data["MEM1_TILE_E_%s_LEN"%i])
            text = font_small.render(str(data_len), True, (255,255,255))
            screen.blit(text, (x0+25, y0-i*80-40+25))

def draw_mem2_id(data):
    x0=300
    y0=350+10
    w=40
    h=40
    pygame.draw.rect(screen, (255,255,255), (x0, y0, w, h), 2)
    text = font.render('M2', True, (255,255,255))
    screen.blit(text, (x0+5, y0+45))
    if parse_val(data["MEM2_ID_INS_IN_VALID"]):
        text = font_small.render('I', True, (255,255,255))
        screen.blit(text, (x0+5, y0+5))
    #fifo_len=parse_val(data["MEM2_ID_FIFO_LENGTH_W"])
    #text = font_small.render(str(fifo_len), True, (255,255,255))
    #screen.blit(text, (x0, y0-15))

def draw_mem2_slice(data):
    x0=300
    y0=300
    w=40
    h=40
    for i in range(4):
        pygame.draw.rect(screen, (255,255,255), (x0, y0-i*80, w+1, h+1), 2)

        if parse_val(data["MEM2_TILE_W_%s_INS_IN_VALID"%i]):
            text = font_small.render('I', True, (255,255,255))
            screen.blit(text, (x0+5, y0-i*80+5))

        if parse_val(data["MEM2_TILE_W_%s_STREAM_IN_VALID"%i]):
            text = font_small.render('D', True, (255,255,255))
            screen.blit(text, (x0+30, y0-i*80+5))

        state=parse_val(data["MEM2_TILE_W_%s_STATE"%i])
        if state==0:
            state_s="P"
        elif state==1:
            state_s="R"
        elif state==2:
            state_s="W"
        text = font.render(state_s, True, (255,255,255))
        screen.blit(text, (x0+15, y0-i*80+10))

        if state_s in ("R","W"):
            data_len=parse_val(data["MEM2_TILE_W_%s_LEN"%i])
            text = font_small.render(str(data_len), True, (255,255,255))
            screen.blit(text, (x0+25, y0-i*80+25))


        pygame.draw.rect(screen, (255,255,255), (x0, y0-i*80-40, w+1, h+1), 2)

        if parse_val(data["MEM2_TILE_E_%s_INS_IN_VALID"%i]):
            text = font_small.render('I', True, (255,255,255))
            screen.blit(text, (x0+5, y0-i*80-40+5))

        if parse_val(data["MEM2_TILE_E_%s_STREAM_IN_VALID"%i]):
            text = font_small.render('D', True, (255,255,255))
            screen.blit(text, (x0+30, y0-i*80-40+5))

        state=parse_val(data["MEM2_TILE_E_%s_STATE"%i])
        if state==0:
            state_s="P"
        elif state==1:
            state_s="R"
        elif state==2:
            state_s="W"
        text = font.render(state_s, True, (255,255,255))
        screen.blit(text, (x0+15, y0-i*80-40+10))

        if state_s in ("R","W"):
            data_len=parse_val(data["MEM2_TILE_E_%s_LEN"%i])
            text = font_small.render(str(data_len), True, (255,255,255))
            screen.blit(text, (x0+25, y0-i*80-40+25))

def draw_vec_id(data):
    x0=250
    y0=350+10
    w=40
    h=40
    pygame.draw.rect(screen, (255,255,255), (x0, y0, w, h), 2)
    text = font.render('V', True, (255,255,255))
    screen.blit(text, (x0+10, y0+45))
    if parse_val(data["VEC_ID_INS_IN_VALID"]):
        text = font_small.render('I', True, (255,255,255))
        screen.blit(text, (x0+5, y0+5))
    #fifo_len=parse_val(data["VEC_ID_FIFO_LENGTH"])
    #text = font_small.render(str(fifo_len), True, (255,255,255))
    #screen.blit(text, (x0, y0-15))

def draw_vec_slice(data):
    x0=250
    y0=260
    w=40
    h=40
    for i in range(4):
        pygame.draw.rect(screen, (255,255,255), (x0, y0-i*80, w+1, 2*h+1), 2)

        if parse_val(data["VEC_TILE_%s_INS_IN_VALID"%i]):
            text = font_small.render('I', True, (255,255,255))
            screen.blit(text, (x0+5, y0-i*80+5))

        if parse_val(data["VEC_TILE_%s_STREAM_IN_VALID_W"%i]) or parse_val(data["VEC_TILE_%s_STREAM_IN_VALID_E"%i]):
            data_s="D"
            if parse_val(data["VEC_TILE_%s_STREAM_IN_VALID_W"%i]) and parse_val(data["VEC_TILE_%s_STREAM_IN_VALID_E"%i]):
                data_s+="-"
            elif parse_val(data["VEC_TILE_%s_STREAM_IN_VALID_W"%i]):
                data_s+="<"
            elif parse_val(data["VEC_TILE_%s_STREAM_IN_VALID_E"%i]):
                data_s+=">"
            text = font_small.render(data_s, True, (255,255,255))
            screen.blit(text, (x0+20, y0-i*80+5))

        state=parse_val(data["VEC_TILE_%s_STATE"%i])
        if state==0:
            state_s="P"
        elif state==1:
            state_s="L"
        elif state==2:
            state_s="A"
        elif state==3:
            state_s="R"
        text = font.render(state_s, True, (255,255,255))
        screen.blit(text, (x0+15, y0-i*80+25))

def draw_dot1_id(data):
    x0=200
    y0=350+10
    w=40
    h=40
    pygame.draw.rect(screen, (255,255,255), (x0, y0, w, h), 2)
    text = font.render('D1', True, (255,255,255))
    screen.blit(text, (x0+10, y0+45))
    if parse_val(data["DOT1_ID_INS_IN_VALID"]):
        text = font_small.render('I', True, (255,255,255))
        screen.blit(text, (x0+5, y0+5))
    #fifo_len=parse_val(data["DOT1_ID_FIFO_LENGTH"])
    #text = font_small.render(str(fifo_len), True, (255,255,255))
    #screen.blit(text, (x0, y0-15))

def draw_dot1_slice(data):
    x0=200
    y0=260
    w=40
    h=40
    for i in range(4):
        pygame.draw.rect(screen, (255,255,255), (x0, y0-i*80, w+1, 2*h+1), 2)

        if parse_val(data["DOT1_TILE_%s_INS_IN_VALID"%i]):
            text = font_small.render('I', True, (255,255,255))
            screen.blit(text, (x0+5, y0-i*80+5))

        if parse_val(data["DOT1_TILE_%s_STREAM_IN_VALID_W"%i]):
            data_s="D"
            text = font_small.render(data_s, True, (255,255,255))
            screen.blit(text, (x0+20, y0-i*80+5))

        state=parse_val(data["DOT1_TILE_%s_STATE"%i])
        if state==0:
            state_s="P"
        elif state==1:
            state_s="L"
        elif state==2:
            state_s="M"
        elif state==3:
            state_s="R"
        text = font.render(state_s, True, (255,255,255))
        screen.blit(text, (x0+15, y0-i*80+25))

def draw_dot2_id(data):
    x0=150
    y0=350+10
    w=40
    h=40
    pygame.draw.rect(screen, (255,255,255), (x0, y0, w, h), 2)
    text = font.render('D2', True, (255,255,255))
    screen.blit(text, (x0+10, y0+45))
    if parse_val(data["DOT2_ID_INS_IN_VALID"]):
        text = font_small.render('I', True, (255,255,255))
        screen.blit(text, (x0+5, y0+5))
    #fifo_len=parse_val(data["DOT2_ID_FIFO_LENGTH"])
    #text = font_small.render(str(fifo_len), True, (255,255,255))
    #screen.blit(text, (x0, y0-15))

def draw_dot2_slice(data):
    x0=150
    y0=260
    w=40
    h=40
    for i in range(4):
        pygame.draw.rect(screen, (255,255,255), (x0, y0-i*80, w+1, 2*h+1), 2)

        if parse_val(data["DOT2_TILE_%s_INS_IN_VALID"%i]):
            text = font_small.render('I', True, (255,255,255))
            screen.blit(text, (x0+5, y0-i*80+5))

        if parse_val(data["DOT2_TILE_%s_STREAM_IN_VALID_W"%i]):
            data_s="D"
            text = font_small.render(data_s, True, (255,255,255))
            screen.blit(text, (x0+20, y0-i*80+5))

        state=parse_val(data["DOT2_TILE_%s_STATE"%i])
        if state==0:
            state_s="P"
        elif state==1:
            state_s="L"
        elif state==2:
            state_s="M"
        elif state==3:
            state_s="R"
        text = font.render(state_s, True, (255,255,255))
        screen.blit(text, (x0+15, y0-i*80+25))

rd=None

running = True
paused = False

while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
        elif event.type == pygame.KEYDOWN:
            print(f"Key {pygame.key.name(event.key)} pressed")
            if event.key == pygame.K_SPACE:
                paused = not paused

    if paused:
        time.sleep(0.1)
        continue

    if not rd:
        rd=csv.DictReader(open('states.csv'))
    try:
        row=next(rd)
    except:
        rd=None
        continue

    print("row",row)
    states={}
    for k,v in row.items():
        states[k.strip()]=v.strip()

    screen.fill((0,0,0))

    draw_dram_if(states)
    draw_pcie_if(states)

    draw_sw_id(states)
    draw_sw_slice(states)

    draw_mem1_id(states)
    draw_mem1_slice(states)

    draw_mem2_id(states)
    draw_mem2_slice(states)

    draw_vec_id(states)
    draw_vec_slice(states)

    draw_dot1_id(states)
    draw_dot1_slice(states)

    draw_dot2_id(states)
    draw_dot2_slice(states)

    t=row["Time"]
    text = font.render('t=%d ns'%float(t), True, (255,255,255))
    screen.blit(text, (10, 10))

    pygame.display.flip()

    time.sleep(0.5)

pygame.quit()
sys.exit()
