module lookahead_adder (
	input  logic  [15:0] a, 
    input  logic  [15:0] b,
	input  logic         cin,
	
	output logic  [15:0] s,
	output logic         cout
);

	/* TODO
		*
		* Insert code here to implement a CLA adder.
		* Your code should be completly combinational (don't use always_ff or always_latch).
		* Feel free to create sub-modules or other files. */
	

	logic gout0;
	logic pout0;	
		
	Block4 block0(
	   .a  (a[3:0]),
	   .b  (b[3:0]),
	   
	   .cin    ({1'b0}),
	   .pin    (1'b0),
	   .gin    (1'b0),
	   
	   .s (s[3:0]),
	   .pout (pin1),
	   .gout (gin1)
	   );
	   
	
	always_comb
	begin
	   c1 = g[0] | 
	end
	Block4 block1(
	   .a  (a[7:4]),
	   .b  (b[7:4]),
	  
	   .cin    (),
	   .pin    (1'b0),
	   .gin    (1'b0)
	   );
	
	


endmodule
