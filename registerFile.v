`timescale 1ns/1ns

module registerFile(clk, rst, A1, A2, A3, WE, WD, RD1, RD2);
        input clk, rst;
        input [19:15] A1;
        input [24:20] A2;
        input [4:0] A3;
        input WE;
        input [31:0] WD;
        output [31:0] RD1, RD2;
        integer i;
        
        reg [31:0] registers [0:31];
        initial begin
                registers[0] <= 32'b0; // ZERO register
	 	registers[1] <= 32'd0;
	 	registers[2] <= 32'd5;
	 	registers[3] <= 32'd12;
	 	registers[4] <= 32'd3;

        end

        always @(negedge clk, posedge rst) begin
                if (rst) begin
                        for (i = 0; i < 32; i = i + 1)
                                registers[i] = 32'b0;
                end
                else if (WE && A3 != 5'b0) begin
                        registers[A3] = WD;
                end
        end
        assign RD1 = registers[A1];
        assign RD2 = registers[A2];
        integer j;
        always @(posedge clk) begin
                //$display("RF| max in x8: ", registers[8], ",   i in x6: ", registers[6]);
        end
endmodule
