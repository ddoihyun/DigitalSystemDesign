`timescale 1ns / 1ps

module datapath(input wire clk, rst, sel1, sel2, en,
                input wire LED1set, LED1clr, LED2set, LED2clr, ld,
                output wire EQ200, GE150, 
                output reg LED1, LED2, output reg [7:0] sum );
  
    wire [7:0] Q_in;
    reg [7:0] opd1;
                
  
    always @(posedge clk)
       if(rst)
          sum <= 0;
       else if(en && ld)
          sum <= Q_in;

     always @*
      if(sel2 == 0)
         opd1 = sum + 50;
       else
         opd1 = sum + 100;
     
     assign Q_in = (sel1)? opd1: 0;
     assign GE150 = (sum == 8'd150 || EQ200 == 1'b1);
     assign EQ200 = (sum == 8'd200)?1:0;
          
     always @(posedge clk, posedge rst)
       if(rst) begin
          LED1 <= 0;
          LED2 <= 0;
       end  
       else begin
        if(LED1clr)
           LED1 <= 0; 
        if(LED2clr)
           LED2 <= 0;
         if(LED1set)
           LED1 <= 1;
         if(LED2set)
           LED2 <= 1;
        end
          
      
endmodule