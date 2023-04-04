module Herzel #(
  parameter NF = 11,
  parameter NS = 10
)(
  // CLK&RST
  input                      rstn        ,
  input                      clk         ,
  // CTRL
  input                      en          ,
  output logic               ready       ,
  // DATA
  input          signed [31:0] alpha_i   ,
  input          signed [31:0] cW_re_i   ,
  input          signed [31:0] cW_im_i   ,
  input          signed [31:0] data_i    ,
  output logic unsigned [31:0] data_o      
); 

logic signed   [63 :0] alpha       ; 
logic signed   [63 :0] coefW_re    ; 
logic signed   [63 :0] coefW_im    ; 
logic signed   [63 :0] data        ; 
logic signed   [63 :0] vm1         ; 
logic signed   [63 :0] vm2         ;
logic signed   [127:0] vm1_alpha   ;
logic signed   [63 :0] vm1_alpha_32;
logic signed   [127:0] vm1_cW_re   ;
logic signed   [63 :0] vm1_cW_re_32;
logic signed   [63 :0] vm1_cW_re_m2;
logic signed   [127:0] vm1_cW_im   ;
logic signed   [63 :0] vm1_cW_im_32;
logic signed   [127:0] data_re     ;
logic unsigned [31 :0] data_re_32  ;
logic signed   [127:0] data_im     ;
logic unsigned [31 :0] data_im_32  ;
logic          [31 :0] indx1       ;
logic                  vmcw        ;

assign alpha     = {{13{alpha_i[31]}}, alpha_i[30:0], {20{1'b0}}}; // 20.44
assign coefW_re  = {{13{cW_re_i[31]}}, cW_re_i[30:0], {20{1'b0}}}; // 20.44
assign coefW_im  = {{13{cW_im_i[31]}}, cW_im_i[30:0], {20{1'b0}}}; // 20.44
assign data      = {{13{data_i [31]}}, data_i [30:0], {20{1'b0}}}; // 20.44
assign vm1_alpha = alpha * vm1; // 20.44 * 20.44 = 40.88

assign vm1_alpha_32 = {vm1_alpha[127], vm1_alpha[107:44]}; // 20.44
assign vm1_cW_re_32 = {vm1_cW_re[127], vm1_cW_re[107:44]}; // 20.44
assign vm1_cW_im_32 = {vm1_cW_im[127], vm1_cW_im[107:44]}; // 20.44
assign vm1_cW_re_m2 = vm1_cW_re_32 - vm2; // 20.44
assign data_re_32   = data_re[119:88]; // 32.0
assign data_im_32   = data_im[119:88]; // 32.0
assign data_o       = data_re_32 + data_im_32; // 32.0

always_ff @(posedge clk) begin
  if (!rstn) begin
    ready     <= 0;
    vm1       <= 0;
    vm2       <= 0;
    vm1_cW_re <= 0;
    vm1_cW_im <= 0;
    data_re   <= 0; 
    data_im   <= 0;
    indx1     <= 0;
    vmcw      <= 0;
  end
  else if (en && !ready) begin
    if (indx1 < (NS - 1)) begin
      vm1   <= data + vm1_alpha_32 - vm2;
      vm2   <= vm1      ;
      indx1 <= indx1 + 1;
    end
    else if (!vmcw) begin
      vm1_cW_re <= coefW_re * vm1;
      vm1_cW_im <= coefW_im * vm1;
      vmcw      <= 1;
    end
    else if (vmcw) begin
      data_re <= vm1_cW_re_m2 * vm1_cW_re_m2;
      data_im <= vm1_cW_im_32 * vm1_cW_im_32;
      ready   <= 1;
    end
  end
end

endmodule