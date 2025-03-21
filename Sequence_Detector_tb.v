module Sequence_Detector_tb();

reg clk, rst, w;
wire z; 

Sequence_Detector uut (
.clk(clk), 
.rst(rst), 
.w(w), 
.z(z)
);

initial begin
    $dumpfile("Sequence_Detector_tb_Simulation.vcd");
    $dumpvars(0);
end

initial begin
w = 1;
clk = 1;
rst = 1;
#25 
rst = 0; 
#5
w = 0;
#10 
w = 0;
#10 
w = 1;
#10 
w = 1;
#10 
w = 1;
#10 
w = 1;
#10 
w = 1;
#10 
w = 1;
#10 
w = 0;
#10 
w = 1;
#300 $finish();

end

always #5 clk = ~clk;

endmodule 