module quad_2to1_mux(
  input logic [4:0] a,
  input logic [4:0] b,
  input logic selector,
  output logic [4:0] s
);
  always_comb begin
    case (selector)
      1'b0: s=a;
      1'b1: s=b;
    endcase
  end
endmodule
