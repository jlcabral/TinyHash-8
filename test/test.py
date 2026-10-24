# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, 10, unit="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    dut._log.info("Test project behavior. Hmnos Perez Chavarro")

    # Set the input values you want to test
    
    vector = [63, 35, 242, 166, 144, 129, 40, 116, 80, 44,
    113, 117, 195, 167, 203, 183, 111, 209, 14, 2,
    150, 127, 94, 114, 202, 58, 103, 59, 170, 228,
    162, 182, 151, 168, 186, 174, 136, 121, 48, 97,
    28, 152, 157, 41, 235, 16, 227, 0, 65, 211,
    239, 219, 146, 107, 138, 191, 176, 112, 57, 101,
    208, 218, 232, 180, 81, 23, 192, 196, 102, 155,
    110, 154, 173, 128, 149, 49, 221, 161, 22, 241,
    115, 165, 225, 205, 42, 67, 50, 62, 5, 46,
    91, 135, 190, 160, 246, 194, 43, 21, 206, 250,
    52, 69, 124, 141, 207, 100, 32, 125, 215, 251,
    223, 163, 123, 189, 185, 197, 126, 87, 54, 4,
    204, 134, 83, 47, 214, 216, 31, 234, 53, 226,
    164, 1, 66, 39, 122, 79, 193, 82, 118, 95,
    233, 237, 177, 213, 153, 171, 199, 179, 88, 85,
    96, 140, 230, 104, 238, 109, 200, 178, 240, 252,
    61, 105, 236, 248, 90, 143, 98, 38, 26, 86,
    55, 75, 18, 229, 201, 30, 71, 10, 6, 249,
    108, 137, 36, 56, 184, 34, 224, 51, 3, 13,
    11, 254, 131, 159, 198, 19, 92, 77, 148, 72,
    60, 158, 74, 99, 255, 20, 247, 12, 37, 24,
    243, 8, 132, 145, 76, 245, 210, 84, 27, 33,
    244, 7, 188, 17, 73, 222, 25, 172, 78, 147,
    70, 130, 142, 106, 139, 119, 181, 217, 253, 169,
    45, 231, 187, 175, 64, 93, 120, 68, 220, 156,
    133, 89, 29, 15, 212, 9]
    #for i in range(0,255)
    #   dut.ui_in.value = i
    #   await ClockCycles(dut.clk, 3)
    #   assert dut.uo_out.value == vector[i]
    dut.ui_in.value = 20
    await ClockCycles(dut.clk, 3)
    assert dut.uo_out.value == 50
    # Keep testing the module by changing the input values, waiting for
    # one or more clock cycles, and asserting the expected output values.
