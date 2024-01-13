`timescale 1ns/1ns

module dataMemory(clk, rst, A, WE, WD, RD);
        input clk, rst;
        input [31:0] A;
        input WE;
        input [31:0] WD;
        output [31:0] RD;
        wire [31:0] addr;
        integer i;

        reg [31:0] memory [0:16384];

        initial begin
                
                $readmemb("array.txt", memory);
        end

        assign addr = {2'b0, A[31:2]};

        always @(posedge clk, posedge rst) begin
                if (WE) begin
                        memory[addr] <= WD;
                end
        end
        
        assign RD = memory[addr];
endmodule