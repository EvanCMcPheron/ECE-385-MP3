module ripple_adder_4(
  input logic [3:0] a,
  input logic [3:0] b,
  input logic cin,
  output logic [3:0] s,
  output logic cout
);
  logic [3:0] local_cins;
  logic [3:0] local_couts;

  full_bit_adder adders [3:0] (
    .a (a),
    .b (b),
    .cin (local_cins),
    .cout (local_couts),
    .s (s)
  );

  always_comb begin
    local_cins[3:1] = local_couts[2:0];
    local_cins[0] = cin;
    cout = local_couts[3];
  end
endmodule
