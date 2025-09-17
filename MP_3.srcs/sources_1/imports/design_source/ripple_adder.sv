module ripple_adder (
	input  logic  [15:0] a, 
    input  logic  [15:0] b,
	input  logic         cin,
	
	output logic  [15:0] s,
	output logic         cout
);

/* TODO
  *
  * Insert code here to implement a ripple adder.
  * Your code should be completly combinational (don't use always_ff or always_latch).
  * Feel free to create sub-modules or other files. */

  logic [15:0] internal_cins;
  logic [15:0] internal_couts;

  full_bit_adder adders [15:0] (
    .a (a),
    .b (b),
    .cin (internal_cins),
    .s (s),
    .cout (internal_couts)
  );

  always_comb begin : testing
    internal_cins[15:1] = internal_couts[14:0];
    internal_cins[0] = cin;
    cout = internal_couts[15];
  end
  
endmodule
