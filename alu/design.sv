module alu (input [3:0] a, input [3:0] b, input [1:0] sel, output reg [3:0] out, output reg carry);
  
  wire [3:0] and_result;
  wire [3:0] or_result;
  assign and_result = a & b;
  assign or_result = a | b;
  
  wire [4:0] add_result;
  assign add_result = a + b;
  
  wire [4:0] sub_result;
  assign sub_result = a + ~(b) + 1;
  
  always @(*) begin
    case (sel)
      2'b00: begin
        out = add_result[3:0];
        carry = add_result[4];
      end
      2'b01: begin
        out = sub_result[3:0];
        carry = sub_result[4];
      end
      2'b10: begin
        out = and_result;
        carry = 1'b0;
      end
      2'b11: begin
        out = or_result;
        carry = 1'b0;
      end
      default: begin
        out = 4'b0000;
        carry = 1'b0;
      end
    endcase
  end
endmodule