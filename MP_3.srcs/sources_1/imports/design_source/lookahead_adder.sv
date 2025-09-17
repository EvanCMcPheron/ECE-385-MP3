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
	

	logic p0;
	logic g0;	
		
	Block4 block0(
	   .a  (a[3:0]),
	   .b  (b[3:0]),
	   
	   .cin    ({1'b0}),
	   
	   .s (s[3:0]),
	   .pout (p0),
	   .gout (g0)
	   );
	   
	logic c1;
	logic g1;
	logic p1;
	
	
	always_comb
	begin
	   c1 = g0 | cin & p0;
	end
	Block4 block1(
	   .a  (a[7:4]),
	   .b  (b[7:4]),
	  
	   .cin    (c1),
	   
	   .s (s[7:4]),
	   .pout (p1),
	   .gout (g1)
	   );
	
	logic c2;
	logic g2;
	logic p2;
	
	
	always_comb
	begin
	   c2 = g1 | g0 & p1 | cin & p0 & p1;
	end
	Block4 block2(
	   .a  (a[11:8]),
	   .b  (b[11:8]),
	  
	   .cin    (c2),
	   
	   .s (s[11:8]),
	   .pout (p2),
	   .gout (g2)
	   );
	
	logic c3;
	logic g3;
	logic p3;
	
	
	always_comb
	begin
	   c3 = g2 | g1 & p2 | g0 & p2 & p1 | cin & p2 & p1 & p0;
	end
	Block4 block3(
	   .a  (a[15:12]),
	   .b  (b[15:12]),
	  
	   .cin    (c3),
	   
	   .s (s[15:12]),
	   .pout (p3),
	   .gout (g3)
	   );
	   
	 always_comb
	 begin
	   cout = g3 | g2 & p3 | g1 & p3 & p2 | g0 & p3 & p2 & p1 | cin & p3 & p2 & p1 & p0;
	 end


endmodule
