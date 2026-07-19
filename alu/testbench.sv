module alu_tb;

    reg [3:0] a, b;
    reg [1:0] sel;
    wire [3:0] out;
    wire carry;
    alu dut (
        .a(a),
        .b(b),
        .sel(sel),
        .out(out),
        .carry(carry)
    );

    initial begin
		$dumpfile("dump.vcd");
      	$dumpvars;
        $monitor("time=%0t a=%b b=%b sel=%b out=%b carry=%b", $time, a, b, sel, out, carry);
        a = 4'b1111; b = 4'b0001; sel = 2'b00;  // ADD: 15 + 1  
        #10;  

        a = 4'b0011; b = 4'b0101; sel = 2'b01;  // SUB: 3 - 5
        #10;

      	a = 4'b0011; b = 4'b0001; sel = 2'b01;  // SUB: 3 - 1
        #10;  
      
		a = 4'b0010; b = 4'b0101; sel = 2'b01;  // SUB: 2 - 5
        #10;
      
		a = 4'b0011; b = 4'b0001; sel = 2'b10;  // AND: 3 & 1
        #10; 

        a = 4'b0011; b = 4'b0001; sel = 2'b11;  // OR3: 3 | 1
        #10; 
        $finish;
    end
endmodule

