`timescale 1ns / 1ps

module VGA_mem_top(
    input            clk,            // Clock input 100MHZ
    input            rst,            // Active HIGH reset
    output   [3:0] VGA_R, VGA_G, VGA_B,
    output            hsyncb,
    output            vsyncb, 
    output  reg       vga_ready
);

wire [11:0] bgr;    
wire clk_100, clk_50, clk_25;
wire [18:0] address;
//wire [7:0] data1, data2; // Two data outputs for two .coe files
wire [7:0] data;         // Selected data (auto switching after 3 seconds)

reg [29:0] counter;     // Counter for 3-second delay
//reg switched;           // Flag to indicate data switch

// Clock core
clk_wiz_0 clk_inst (
    .clk_out1(clk_100),
    .clk_out2(clk_50),
    .clk_out3(clk_25),
    .reset(rst), 
    .locked(),
    .clk_in1(clk)
);

// Frame buffer for .coe file 1
blk_mem_gen_0 frame_buffer_1 (
    .clka(clk_50),    
    .wea(1'b0),        // Read-only
    .addra(address),   
    .dina(8'd0),       
    .douta(data)      
);        

//// Frame buffer for .coe file 2
//blk_mem_gen_1 frame_buffer_2 (
//    .clka(clk_50),    
//    .wea(1'b0),        // Read-only
//    .addra(address),   
//    .dina(8'd0),       
//    .douta(data2)      
//);        

//always @(posedge clk_50 or posedge rst) begin
//    if (rst) begin
//        counter <= 28'd0;
//        switched <= 1'b0;
//        vga_ready <= 1'b0;
//    end else if (!switched) begin
//        if (counter >= 28'd250_000_000) begin // 5 seconds at 50MHz
//            switched <= 1'b1;
//            vga_ready <= 1'b1;
//        end else begin
//            counter <= counter + 1'b1;
//        end
//    end
//end
    always @(posedge clk_50 or posedge rst) begin
    if (rst) begin
        counter <= 28'd0;
        vga_ready <= 1'b0;
    end else begin
        if (counter >= 28'd250_000_000) begin // 5 seconds at 50MHz
            vga_ready <= 1'b1; // 5초 후 활성화
        end else begin
            counter <= counter + 1'b1; // 카운터 증가
        end
    end
end



//// Select data based on the switching flag
//always @(*) begin
//    if (switched) begin
//        data = data2;
//    end else begin
//        data = data1;
//    end
//end

// VGA Signal Assignment
assign {VGA_B, VGA_G, VGA_R} = bgr;

TOP_VGA vga (
    .clk(clk_25),
    .clk_en(1'b1),    // Enables VGA
    .rst(rst),
    .din(data),
    .WES(),
    .addr(address),
    .bgr(bgr),
    .hsyncb(hsyncb),
    .vsyncb(vsyncb),
    .Yoffset_top(3'b000) // Fixed offset
);

endmodule
