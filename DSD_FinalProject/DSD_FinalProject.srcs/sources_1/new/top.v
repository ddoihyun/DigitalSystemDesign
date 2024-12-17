module top(
        // BGM I/O
        output audio_output,
        
        // Temperature I/O
        inout         TMP_SDA,          // i2c sda on temp sensor - bidirectional
        output        TMP_SCL,          // i2c scl on temp sensor
        output [6:0]  SEG,              // 7 segments of each display
        output [7:0]  AN,               // 8 anodes of 8 displays
        output [15:0] LED,              // nexys leds = binary temp in deg C or deg F
        
        // Camera I/O
        input wire i_top_clk,
        input wire i_top_rst,
        
        input wire  i_top_cam_start, 
        output wire o_top_cam_done, 
        output wire o_top_cam_ready,
            
        input wire i_top_inc_sobel_thresh,
        input wire i_top_dec_sobel_thresh,

        // I/O to camera
        input wire       i_top_pclk, 
        input wire [7:0] i_top_pix_byte,
        input wire       i_top_pix_vsync,
        input wire       i_top_pix_href,
        output wire      o_top_reset,
        output wire      o_top_pwdn,
        output wire      o_top_xclk,
        output wire      o_top_siod,
        output wire      o_top_sioc,
        
        // I/O to VGA 
        output wire [3:0] o_top_vga_red,
        output wire [3:0] o_top_vga_green,
        output wire [3:0] o_top_vga_blue,
        output wire       o_top_vga_vsync,
        output wire       o_top_vga_hsync
    );
    
    // BGM CODE
    wire i_top_sobel = i_top_inc_sobel_thresh | i_top_dec_sobel_thresh;
    
    assign audio_output = en_audio ? speaker : voice_fre;
    
    wire voice_fre;
    top_bgm bgm(
       .clk(i_top_clk),
       .hit_wall(),
       .ball_x(),
       .change_mode(i_top_sobel),
       .voice_fre(voice_fre),
       .state()
   );
   
   wire speaker;
   
   top_temp temp(
        .CLK100MHZ(i_top_clk),
        .TMP_SDA(TMP_SDA),
        .TMP_SCL(TMP_SCL),
        .SEG(SEG),
        .AN(AN),
        .LED(LED),
        .speaker(speaker),
        .en(en_audio)
   );

   // top_cam 시작 신호를 VGA_ready 신호에 의해 제어
   wire cam_start_cond = i_top_cam_start & vga_ready;
   
   wire [3:0] o_top_vga_red2;
   wire [3:0] o_top_vga_green2;
   wire [3:0] o_top_vga_blue2;
   wire       o_top_vga_vsync2;
   wire       o_top_vga_hsync2;
   
   top_cam cam(
        .i_top_clk(i_top_clk),
        .i_top_rst(i_top_rst),
        .i_top_cam_start(cam_start_cond), // 조건부 시작 신호
        .o_top_cam_done(o_top_cam_done),
        .o_top_cam_ready(o_top_cam_ready),
        .i_top_inc_sobel_thresh(i_top_inc_sobel_thresh),
        .i_top_dec_sobel_thresh(i_top_dec_sobel_thresh),
        .i_top_pclk(i_top_pclk),
        .i_top_pix_byte(i_top_pix_byte),
        .i_top_pix_vsync(i_top_pix_vsync),
        .i_top_pix_href(i_top_pix_href),
        .o_top_reset(o_top_reset),
        .o_top_pwdn(o_top_pwdn),
        .o_top_xclk(o_top_xclk),
        .o_top_siod(o_top_siod),
        .o_top_sioc(o_top_sioc),
        .o_top_vga_red(o_top_vga_red2),
        .o_top_vga_green(o_top_vga_green2),
        .o_top_vga_blue(o_top_vga_blue2),
        .o_top_vga_vsync(o_top_vga_vsync2),
        .o_top_vga_hsync(o_top_vga_hsync2)
    );
    
    assign o_top_vga_red = (vga_ready) ? o_top_vga_red2 : o_top_vga_red1;
    assign o_top_vga_green = (vga_ready) ? o_top_vga_green2 : o_top_vga_green1;
    assign o_top_vga_blue = (vga_ready) ? o_top_vga_blue2 : o_top_vga_blue1;
    assign o_top_vga_vsync = (vga_ready) ? o_top_vga_vsync2 : o_top_vga_vsync1;
    assign o_top_vga_hsync = (vga_ready) ? o_top_vga_hsync2 : o_top_vga_hsync1;
    
   wire [3:0] o_top_vga_red1;
   wire [3:0] o_top_vga_green1;
   wire [3:0] o_top_vga_blue1;
   wire       o_top_vga_vsync1;
   wire       o_top_vga_hsync1;

    VGA_mem_top top_vga_ready(
        .clk(i_top_clk), 
        .rst(i_top_rst),
        .VGA_R(o_top_vga_red1),
        .VGA_G(o_top_vga_green1),
        .VGA_B(o_top_vga_blue1),
        .hsyncb(o_top_vga_hsync1),
        .vsyncb(o_top_vga_vsync1),
        .vga_ready(vga_ready)
    );
endmodule
