`default_nettype none

module tt_um_jlcabral_tinyhash_8 (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    // Intermediate round values
    wire [7:0] r1_xor, r1_add, r1_out;
    wire [7:0] r2_xor, r2_add, r2_out;
    wire [7:0] r3_xor, r3_add, r3_out;
    wire [7:0] r4_xor, r4_add, r4_out;

  assign uo_out  = 0;
  assign uio_out = 0;
  assign uio_oe  = 0;

  reg [1:0] status = 2'b0;

  always @(posedge clk) begin
    
    if (status==0 || !rst_n) begin
      uo_out <= 8'b0;
      status <= 2'b1;
    end 
    
    else begin
    
        if (status==1 && ena) 
        begin

            // ---------------------------------------------------------
            // Round 1
            // ---------------------------------------------------------
            r1_xor <= ui_in ^ (ui_in << 1);
            r1_add <= r1_xor + 8'hA7;
            r1_out <= {r1_add[4:0], r1_add[7:5]};

            // ---------------------------------------------------------
            // Round 2
            // ---------------------------------------------------------
            r2_xor <= r1_out ^ (r1_out >> 2);
            r2_add <= r2_xor + 8'h3D;
            r2_out <= {r2_add[4:0], r2_add[7:5]}; // ROR 5 is equivalent to ROL 3

            // ---------------------------------------------------------
            // Round 3
            // ---------------------------------------------------------
            r3_xor <= r2_out ^ (r2_out << 3);
            r3_add <= r3_xor + 8'h6B;
            r3_out <= {r3_add[5:0], r3_add[7:6]};

            // ---------------------------------0----------------------
            // Round 4
            // ---------------------------------------------------------
            r4_xor <= r3_out ^ (r3_out >> 1);
            r4_add <= r4_xor + 8'hD5;
            r4_out <= {r4_add[2:0], r4_add[7:3]}; // ROR 3

            uo_out <= r4_out;
        end // status==1
      end
    
  end // always

endmodule
