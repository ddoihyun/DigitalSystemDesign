`timescale 1ns / 1ps

module controller_mealy(input wire clk,rst, GE150, EQ200, BTN50, BTN100, 
                   output reg ld, sel1, sel2, 
                   LED1set, LED1clr, LED2set, LED2clr);
     localparam S0 = 2'b00, S1=2'b01, S2=2'b10, S3=2'b11;
     
     reg [1:0] cst, nxtst;
     
     always @(posedge clk, posedge rst)
       if(rst)
          cst <= S0;
       else 
          cst <= nxtst;
          
      always @(*) 
      begin
      sel1 = 0;
      sel2 = 0;
      ld = 0;
      {LED1clr,LED1set} = 2'b00;
      {LED2clr,LED2set} = 2'b00;
      case (cst)
      S0:begin 
           nxtst = S1;
           ld = 1;
           sel1 = 0;
         end
      S1:begin
           if(BTN50 == 1) begin // sum = sum + 50
              sel2 = 0;
              sel1 = 1;
              ld = 1;
              nxtst = S2;
           end
           else if(BTN100 ==1) begin
              sel2 = 1;
              sel1 = 1;
              ld = 1;
              nxtst = S2;
           end
           else nxtst = S1;
         end
      S2:
         if(GE150 == 0 && EQ200 == 0) begin
              nxtst = S1;
              LED1clr =1;
              LED2clr = 1;
              LED1set = 0;
              LED2set = 0;
          end
          else begin
             nxtst = S0;
             LED1clr = 0;
             LED2clr = 0;
     
            if(GE150 == 1)
              LED1set = 1;
            else
               LED1set = 0;
            
            if(EQ200 == 1) 
                 LED2set = 1;
            else
                 LED2set = 0;
                 
            end
      default: 
             nxtst = S0;
      endcase
     end   
                    
endmodule