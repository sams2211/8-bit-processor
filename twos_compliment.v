module twosCompliment(in,result);
   input [7:0] in;
   output [7:0] result;
   reg result;
   always@(*) 
   begin
       result = ~in+1;
   end
endmodule
