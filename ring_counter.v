module ring_counter(count,clk,rst);
input clk,rst;
output reg [3:0]count;
initial
count = 4'b1000; 
always @(posedge clk)
begin
if(rst)
count <= 4'b1000;
else
begin
count <= count >> 1;
count[3] <= count[0];
end
end
endmodule


module ring_counter_tb();
reg clk,rst;
wire [3:0]counter;
ring_counter dut(counter,clk,rst);

initial begin 
clk = 1'b0;
rst = 1'b0;
end 
always #20 clk = ~clk;
//initial #180 $stop;
endmodule
