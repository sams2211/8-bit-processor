`include "CPU.v"
module cpu_tb;
    reg CLK, RESET ;
    wire [31:0]  PC;
    reg [31:0] INSTRUCTIONN;

    reg [7:0] instr_mem[1023:0];
    always@(PC)
    begin
        #2
        INSTRUCTIONN = {instr_mem[PC+3] , instr_mem[PC+2] , instr_mem[PC+1] , instr_mem[PC]};

    end
    initial 
    begin
        {instr_mem[10'd3] , instr_mem[10'd2] , instr_mem[10'd1] , instr_mem[10'd0]}     = 32'b00000000000000000000000000000011;
        {instr_mem[10'd7] , instr_mem[10'd6] , instr_mem[10'd5] , instr_mem[10'd4]}     = 32'b00000000000000010000000000000101;
        {instr_mem[10'd11] , instr_mem[10'd10] , instr_mem[10'd9] , instr_mem[10'd8]}    = 32'b00000010000000100000000100000000;
        {instr_mem[10'd15] , instr_mem[10'd14] , instr_mem[10'd13] , instr_mem[10'd12]} = 32'b00000101000001110000001100000010;
        {instr_mem[10'd19] , instr_mem[10'd18] , instr_mem[10'd17] , instr_mem[10'd16]} = 32'b00000010000001000000000100000000;
        {instr_mem[10'd23] , instr_mem[10'd22] , instr_mem[10'd21] , instr_mem[10'd20]} = 32'b00000100000001010000000100000100;
    end 

    cpu mycpu(PC,INSTRUCTIONN , CLK, RESET);
    initial
    begin
        $dumpfile("cpu_wavedata.vcd");
                $dumpvars(0,cpu_tb);
        CLK = 1'b1;
        RESET = 1'b0;

        #2
        RESET = 1'b1;
        #4
        RESET = 1'b0;
        #500
        $finish;
    end

    always
        #5 CLK = ~CLK;
endmodule