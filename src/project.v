`default_nettype none

module tt_um_jlcabral_tinyhash_8 (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);

    wire [7:0] r1_xor, r1_add, r1_out;
    wire [7:0] r2_xor, r2_add, r2_out;
    wire [7:0] r3_xor, r3_add, r3_out;
    wire [7:0] r4_xor, r4_add, r4_out;

    // Round 1
    assign r1_xor = ui_in ^ (ui_in << 1);
    assign r1_add = r1_xor + 8'hA7;
    assign r1_out = {r1_add[4:0], r1_add[7:5]};

    // Round 2
    assign r2_xor = r1_out ^ (r1_out >> 2);
    assign r2_add = r2_xor + 8'h3D;
    assign r2_out = {r2_add[4:0], r2_add[7:5]};

    // Round 3
    assign r3_xor = r2_out ^ (r2_out << 3);
    assign r3_add = r3_xor + 8'h6B;
    assign r3_out = {r3_add[5:0], r3_add[7:6]};

    // Round 4
    assign r4_xor = r3_out ^ (r3_out >> 1);
    assign r4_add = r4_xor + 8'hD5;
    assign r4_out = {r4_add[2:0], r4_add[7:3]};

    // Combinational output
    assign uo_out  = ena ? r4_out : 8'b0;

    // Unused bidirectional IOs
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

      // List all unused inputs to prevent warnings
    wire _unused = &{clk, rst_n, uio_in, 1'b0};

endmodule

`default_nettype wire
