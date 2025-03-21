// REQUIRED TASK:

// Design and implement a sequence detector that meets the following specifications: 

//       The detector contains single input 'w' and output 'z'. 
//       All changes in the circuit occur on the positive edge of a clock signal. 
//       The output 'z' is equal to '1' if input 'w' receives sequence "01111110" in the
//       immediately preceding clock cycles. 

module Sequence_Detector(clk, rst, w, z);

input clk, rst, w;
output reg z;

reg [2:0] NS, CS, S0;

initial begin
  NS = 3'b000;
  CS = 3'b000;
  S0 = 3'b001;
end

always @ (posedge clk) begin
  if(rst) begin
    CS <= 3'b000;
  end
  else begin
    CS <= NS;
  end
end

always @(*) begin
  case (CS) 3'b000:begin //State S0
    if(w === 0) begin
      NS<=3'b001;
      z = 0;
    end
    else begin
      NS<=3'b000;
      z = 0;
    end
    end

    3'b001:begin
    if(w === 1) begin
      NS<=3'b010;
      z = 0;
    end
    else begin
      NS<=3'b001;
      z = 0;
    end
    end

    3'b010:begin
    if(w === 1) begin
      NS<=3'b011;
      z = 0;
    end
    else begin
      NS<=S0;
      z = 0;
    end
    end

    3'b011:begin
    if(w === 1) begin
      NS<=3'b100;
      z = 0;
    end
    else begin
      NS<=S0;
      z = 0;
    end
    end

    3'b100:begin
    if(w === 1) begin
      NS<=3'b101;
      z = 0;
    end
    else begin
      NS<=S0;
      z = 0;
    end
    end

    3'b101:begin
    if(w === 1) begin
      NS<=3'b110;
      z = 0;
    end
    else begin
      NS<=S0;
      z = 0;
    end
    end

    3'b110:begin
    if(w === 1) begin
      NS<=3'b111;
      z = 0;
    end
    else begin
      NS<=S0;
      z = 0;
    end
    end

    3'b111:begin
    if(w === 0) begin
      NS<=S0;
      z = 1;
    end
    else begin
      NS<=S0;
      z = 0;
    end
    end

  endcase
end

endmodule