`timescale 1ns / 1ps

module controller_moore(input wire clk, rst, GE150, EQ200, BTN50, BTN100, en,
                   output reg ld, sel1, sel2, 
                   LED1set, LED1clr, LED2set, LED2clr);
     localparam S0 = 3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100, S5 = 3'b101, S6=3'b110, S7=3'b111;
     
     reg [2:0] cst, nxst;
     
     always @(posedge clk, posedge rst)
         if(rst)
            cst <= S0;
         else if(en)
            cst <= nxst;
     
     always @* begin // Nexst state
      case(cst)
      S0: nxst = S1;
      S1:if(BTN50 == 1) 
            nxst = S2;
          else if(BTN100 ==1) 
            nxst = S3;
          else 
            nxst = S1;
      S2: nxst = S4;
      S3: nxst = S4;
      S4: if(GE150 == 1)
            nxst = S5;
          else
            nxst = S1;
      S5: if(EQ200 == 1)
            nxst = S6;
          else
            nxst = S0;
      S6: nxst = S0;     
      default: nxst = S0;
      endcase
      end 
      
    always @* begin
          {sel1,sel2, ld}  = 3'b000;
          {LED1clr,LED1set} = 2'b00;
          {LED2clr,LED2set} = 2'b00;
          case(cst)
          S0: begin 
                ld = 1;
                sel1 = 0;
              end
          S2: begin // sum = sum + 50
               sel2 = 0;
               sel1 = 1;
               ld = 1;
               LED1clr = 1;
               LED2clr = 1;
              end
          S3: begin  // sum = sum + 100
               sel2 = 1;
               sel1 = 1;
               ld = 1;
               LED1clr = 1;
               LED2clr = 1;
              end
          S5: begin
                LED1set = 1;
              end
          S6: begin
                LED2set = 1; 
              end
          default: {LED1set, LED2set, LED1clr, LED2clr} = 4'b0000; // Nothing to do
          endcase
    end 
      
endmodule
