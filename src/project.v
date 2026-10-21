/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_jlcabral_tinyhash_8 (
    input  wire [7:0] data_2_convert,
    output wire [7:0] hash,
    input  wire rst_n,
    input  wire clk
);

    // Intermediate round values
    wire [7:0] r1_xor, r1_add, r1_out;
    wire [7:0] r2_xor, r2_add, r2_out;
    wire [7:0] r3_xor, r3_add, r3_out;
    wire [7:0] r4_xor, r4_add, r4_out;

  reg [1:0] status = 2'b0;

  always @(posedge clk) begin
    
    if (status==0 || rst_n==1) begin
      hash   <= 8'b0;
      status <= 2'b1;
    end 
    
    else begin
    
        if (status==1) 
        begin

            // ---------------------------------------------------------
            // Round 1
            // ---------------------------------------------------------
            r1_xor <= data_2_convert ^ (data_2_convert << 1);
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

            hash <= r4_out;
        end // status==1
      end
    
  end // always
    
endmodule
