`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2025 10:29:02 PM
// Design Name: 
// Module Name: Block4
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


module Block4(
    input logic [3:0] a,
    input logic [3:0] b,
    input logic cin,
    
    output logic [3:0] s,
    output logic pout,
    output logic gout
    );
    
    logic [3:0] p;
    logic [3:0] g;
    logic [3:0] c;
    
    always_comb 
    begin
        g[0] = a[0] & b[0];
        g[1] = a[1] & b[1];
        g[2] = a[2] & b[2];
        g[3] = a[3] & b[3]; 
        
        p[0] = a[0] ^ b[0];
        p[1] = a[1] ^ b[1];
        p[2] = a[2] ^ b[2];
        p[3] = a[3] ^ b[3];
        
        c[0] = cin;
        c[1] = cin & p[0] | g[0];
        c[2] = (cin & p[0] & p[1]) | (g[0] & p[1]) | g[1];
        c[3] = cin & p[0] & p[1] & p[2] | g[0] & p[1] & p[2] | g[1] & p[2] | g[2];
        
        s[0] = (a[0] ^ b[0] ^ c[0]);
        s[1] = (a[1] ^ b[1] ^ c[1]);
        s[2] = (a[2] ^ b[2] ^ c[2]);
        s[3] = (a[3] ^ b[3] ^ c[3]);
        
        pout = p[0] & p[1] & p[2] & p[3];
        gout = g[3] | g[2] & p[3] | g[1] & p[3] & p[2] | g[0] & p[3] & p[2] & p[1];
    end
    
endmodule
