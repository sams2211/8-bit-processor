module mux2_1(in0,in1,se1,out);
 input se1;      //immediae value
 input [7:0] in0; 
 input [7:0] in1;           // register output
 output [7:0] out;
 reg out;
always @(in0,in1,se1)
 begin
  if(se1==1'b1) begin
   out =in0;
  end 
  else 
  begin
   out =in1;
  end
 end    
endmodule