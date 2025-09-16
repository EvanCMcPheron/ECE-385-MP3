module select_4b_subunit(
  input logic [3:0] a,
  input logic [3:0] b,
  input logic cin,
  output logic [3:0] s,
  output logic [1:0] cout // [carry for 0-cin circuit, carry for 1-cin circuit]
);
  logic [1:0] assumed_cins;
  
  assign assumed_cins[0] = 1'b0;
  assign assumed_cins[1] = 1'b1;

  logic [3:0] outs [2];

  ripple_adder_4 adders [1:0] (
    .a ({a, a}),
    .b ({b, b}),
    .cin (assumed_cins),
    .cout (cout),
    .s (outs)
  );

  quad_2to1_mux mux(
    .a (outs[0]),
    .b (outs[1]),
    .selector (cin),
    .s (s)
  );

endmodule
