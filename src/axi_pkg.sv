package axi_pkg;

typedef struct {
  // write
  logic [3 :0] awid    ;
  logic [31:0] awaddr  ;
  logic [3 :0] awlen   ;
  logic [2 :0] awsize  ;
  logic [1 :0] awburst ;
  logic [1 :0] awlock  ;
  logic [3 :0] awcache ;
  logic [2 :0] awprot  ;
  logic        awvalid ;
  logic [31:0] wid     ;
  logic [31:0] wdata   ;
  logic [3 :0] wstrb   ;
  logic        wlast   ;
  logic        wvalid  ;
  logic        bready  ;
  // read
  logic [3 :0] arid    ;
  logic [31:0] araddr  ;
  logic [3 :0] arlen   ;
  logic [2 :0] arsize  ;
  logic [1 :0] arburst ;
  logic [1 :0] arlock  ;
  logic [3 :0] arcache ;
  logic [2 :0] arprot  ;
  logic        arvalid ;
  logic        rready  ;
} axi_mosi;

typedef struct {
  // write
  logic        awready ;
  logic        wready  ;
  logic [3 :0] bid     ;
  logic [1 :0] bresp   ;
  logic        bvalid  ;
  // read
  logic        arready ;
  logic [3 :0] rid     ;
  logic [31:0] rdata   ;
  logic [1 :0] rresp   ;
  logic        rlast   ;
  logic        rvalid  ;
} axi_miso;

typedef struct {
  // write
  logic [31:0] awaddr  ;
  logic [2 :0] awprot  ;
  logic        awvalid ;
  logic [31:0] wdata   ;
  logic [3 :0] wstrb   ;
  logic        wvalid  ;
  logic        bready  ;
  // read
  logic [31:0] araddr  ;
  logic [2 :0] arprot  ;
  logic        arvalid ;
  logic        rready  ;
} axi_lite_mosi;

typedef struct {
  // write
  logic        awready ;
  logic        wready  ;
  logic [1 :0] bresp   ;
  logic        bvalid  ;
  // read
  logic        arready ;
  logic [31:0] rdata   ;
  logic [1 :0] rresp   ;
  logic        rvalid  ;
} axi_lite_miso;

endpackage : axi_pkg