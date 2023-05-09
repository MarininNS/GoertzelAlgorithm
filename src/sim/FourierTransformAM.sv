// Карта памяти для модуля
localparam VERSION    = 32'h0000_0000; // RW
localparam DEBUG      = 32'h0000_0004; // RW
localparam FREQ_1     = 32'h0000_0008; // RW
localparam FREQ_2     = 32'h0000_000C; // RW
localparam FREQ_3     = 32'h0000_0010; // RW
localparam FREQ_4     = 32'h0000_0014; // RW
localparam FREQ_5     = 32'h0000_0018; // RW
localparam FREQ_6     = 32'h0000_001C; // RW
localparam FREQ_7     = 32'h0000_0020; // RW
localparam FREQ_8     = 32'h0000_0024; // RW
localparam FREQ_9     = 32'h0000_0028; // RW
localparam FREQ_10    = 32'h0000_002C; // RW
localparam FREQ_11    = 32'h0000_0030; // RW
localparam EN_CORDIC  = 32'h0000_0034; // RW
localparam STATUS     = 32'h0000_0038; // R 
localparam DATA_1     = 32'h0000_003C; // R
localparam DATA_2     = 32'h0000_0040; // R
localparam DATA_3     = 32'h0000_0044; // R
localparam DATA_4     = 32'h0000_0048; // R
localparam DATA_5     = 32'h0000_004C; // R
localparam DATA_6     = 32'h0000_0050; // R
localparam DATA_7     = 32'h0000_0054; // R
localparam DATA_8     = 32'h0000_0058; // R
localparam DATA_9     = 32'h0000_005C; // R
localparam DATA_10    = 32'h0000_0060; // R
localparam DATA_11    = 32'h0000_0064; // R

localparam STATUS_ANGEL_MSK      = 32'h0000_0001;
localparam STATUS_CORDIC_MSK     = 32'h0000_0002; // R 
localparam STATUS_HERZEL1_MSK    = 32'h0000_0100; // R 
localparam STATUS_HERZEL11_MSK   = 32'h0004_0000; // R 
localparam STATUS_HERZEL_ALL_MSK = 32'h0007_FF00; // R 


