//////////////////////////////////////////////////////////////////////////////////
// Company: S.C. Inc
// Engineer: Evan McPheron
// 
// Create Date: 09/15/2025 10:32:01 PM
// Design Name: 
// Module Name: TB_Evan
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module TB_Evan();

timeunit 10ns;
timeprecision 1ns;

// DUT ripple_adder
logic [15:0] a; // Input Logic
logic [15:0] b;

logic [15:0] s; //output logic
logic cin;
logic cout;

assign cin = 0; // we can assume assign is zero

select_adder adder (
  .a (a),
  .b (b),
  .cin (cin),
  .s (s),
  .cout (cout)
);

logic [3:0] ua;
logic [3:0] ub;
logic ucin;

assign ua = 4'b1100;
assign ub = 4'b0110;
assign ucin = 1;

logic [1:0] ucout;
logic [3:0] us;
select_4b_subunit unit_4b (
  .a (ua),
  .b (ub),
  .s (us),
  .cin (ucin),
  .cout (ucout)
);

logic [3:0] fs;
logic fcout;
ripple_adder_4 fadder_4 (
  .a (ua),
  .b (ub),
  .s (fs),
  .cin (ucin),
  .cout (fcout)
);

initial begin: TESTS
  s = 16'h0000;
  a = 16'h2222;
  b = 16'h3333;

  #5 $display("Output value is %h with a c-value of $b", s, b);

  // bit_a = 1'b1;
  // bit_b = 1'b1;
  //
  // #2 assert (bit_s == 1'b1 && cout == 1'b1) else $display("a=1, b=1 incorrect!");
  //
  // bit_a = 1'b0;
  // bit_b = 1'b1;
  //
  // #2 assert (bit_s == 1'b1 && cout == 1'b0) else $display("a=1, b=0 incorrect!");
  //
  // bit_a = 1'b0;
  // bit_b = 1'b0;
  //
  // #2 assert (bit_s == 1'b0 && cout == 1'b0) else $display("a=0, b=0 incorrect!");

  #3 assign ucin = 0;
  assign ua = 4'b0110;
  assign ub = 4'b0011;

  #1 assign ucin = 1;

  #1 assign ua = 4'b1000;
  assign ub = 4'b0111;

  #1 assign ucin = 0;

  #3 $finish();
end
endmodule
