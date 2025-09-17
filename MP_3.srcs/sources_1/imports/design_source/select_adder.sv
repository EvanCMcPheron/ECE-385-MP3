module select_adder (
	input  logic  [15:0] a, 
  input  logic  [15:0] b,
	input  logic         cin,
	
	output logic  [15:0] s,
	output logic         cout
);
  // First one is the output of the first cluster, last is the final cout
  logic cins[4];
  // 3 wires because the first cluster is a single adder
  logic [1:0] couts[3];

  // First cluster, doesnt use swap block as cin bit is known
  ripple_adder_4 adder_1 (
    .a (a[3:0]),
    .b (b[3:0]),
    .cin (cin),
    .s (s[3:0]),
    .cout (cins[0]) //First cin for the 3-clusters
  );

  genvar i;
  generate
    for (i=1; i < 4; i++) begin
      
      select_4b_subunit adder (
        .a (a[3+4*i:4*i]),
        .b (b[3+4*i:4*i]),
        .s (s[3+4*i:4*i]),
        .cin (cins[i - 1]),
        .cout (couts[i - 1])
      );
    end
  endgenerate

  always_comb begin
    cins[1] = couts[0][0] | (couts[0][1] & cins[0]);
    cins[2] = couts[1][0] | (couts[1][1] & cins[1]);
    cins[3] = couts[2][0] | (couts[2][1] & cins[2]);
    cout = cins[3];
  end

endmodule
