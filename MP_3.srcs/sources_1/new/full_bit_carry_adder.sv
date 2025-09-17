module full_bit_adder(
  input logic a,
  input logic b,
  input logic cin,
  output logic s,
  output logic cout
);

always_comb begin
  s = a^b^cin;
  cout = a & b | a & cin | b & cin;
end

endmodule

