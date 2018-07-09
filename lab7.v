module lab7(seg1,seg2,seg3,seg4,S,A,B,LED);
output [10:0]LED;
	

input [2:0]A;
input [2:0]B;
wire [5:0]S;
wire [2:0]line;
wire [3:0]C;
wire [3:0]D;
output [5:0]S;
output [0:7]seg1;
output [0:7]seg2;
output [0:7]seg3;
output [0:7]seg4;
Seg7 num1(A,seg1);
Seg7 num2(B,seg2);
assign C[0] = A[0];
assign C[1] = A[1];
assign C[2] = A[2];
assign D[0] = B[0];
assign D[1] = B[1];
assign D[2] = B[2]; 

half_adder m1(.Sum(S[0]),.Cout(line[0]),.a(C[0]),.b(D[0]),.c(0));
half_adder m2(.Sum(S[1]),.Cout(line[1]),.a(C[1]),.b(D[1]),.c(line[0]));
half_adder m3(.Sum(S[2]),.Cout(line[2]),.a(C[2]),.b(D[2]),.c(line[1]));
half_adder m4(.Sum(S[3]),.Cout(S[4]),.a(C[3]),.b(D[3]),.c(line[2]));
div	 num3(S,seg3,seg4);

endmodule 


module half_adder(Sum,Cout,a,b,c);

input a,b,c;
output Sum,Cout;

assign Sum = (a^b)^c;//Sum
assign Cout = ((a^b)&c) | (a&b);//Cout


endmodule 


module Seg7(input [2:0] num, output [0:7] seg);
   reg [7:0] nseg;
    always @(num) begin
        case (num)
            3'b000: nseg = 8'b11111100; // 0
            3'b001: nseg = 8'b01100000; // 1
            3'b010: nseg = 8'b11011010; // 2
            3'b011: nseg = 8'b11110010; // 3
            3'b100: nseg = 8'b01100110; // 4
            3'b101: nseg = 8'b10110110; // 5
            3'b110: nseg = 8'b10111110; // 6
            3'b111: nseg = 8'b11100100; // 7
            default: nseg = 8'b00000000; //  
        endcase
    end
   assign seg = ~nseg;
endmodule 

module div(input [3:0] num, output [0:7] seg1,output [0:7] seg2);
 reg [7:0] nseg1;
 reg [7:0] nseg2;
    always @(num) begin
        case (num)
			4'b0000: 
            begin
            nseg1 = 8'b11111100; // 0
            nseg2 = 8'b11111100; // 0
            end
			4'b0001: 
            begin
            nseg1 = 8'b11111100; // 0
            nseg2 = 8'b01100000; // 1
            end
			4'b0010: 
            begin
            nseg1 = 8'b11111100; // 0
            nseg2 = 8'b11011010;//  2
            end
            4'b0011: 
            begin
            nseg1 = 8'b11111100; // 0
            nseg2 = 8'b11110010; // 3
            end
			4'b0100: 
            begin
            nseg1 = 8'b11111100; // 0
            nseg2 = 8'b01100110; // 4
            end
            4'b0101: 
            begin
            nseg1 = 8'b11111100; // 0
            nseg2 = 8'b10110110; // 5
            end
            4'b0110: 
            begin
            nseg1 = 8'b11111100; // 0
            nseg2 = 8'b10111110; // 6
            end
            4'b0111: 
            begin
            nseg1 = 8'b11111100; // 0
            nseg2 = 8'b11100100; // 7
            end
            4'b1000: 
            begin
            nseg1 = 8'b11111100; // 0
            nseg2 = 8'b11111110; // 8
            end
            4'b1001: 
            begin
            nseg1 = 8'b11111100; // 0
            nseg2 = 8'b11110110; // 9
            end
            4'b1010: 
            begin
            nseg1 = 8'b01100000; // 1
            nseg2 = 8'b11111100; // 0
            end
            4'b1011: 
            begin
            nseg1 = 8'b01100000; // 1
            nseg2 = 8'b01100000; // 1
            end
            4'b1100: 
            begin
            nseg1 = 8'b01100000; // 1
            nseg2 = 8'b11011010; // 2
            end
            4'b1101: 
            begin
            nseg1 = 8'b01100000; // 1
            nseg2 = 8'b11110010; // 3
            end
			4'b1110: 
            begin
            nseg1 = 8'b01100000; // 1
            nseg2 = 8'b01100110; // 4
            end
        endcase
    end
   assign seg1 = ~nseg1;
   assign seg2 = ~nseg2;
endmodule 


 