module div_all #(
  NF = 11
) (
  input                       rstn       ,
  input                       clk        ,
  input                       en         ,
  output logic                valid      ,
  input                [31:0] num_samp_i , // (32.0 )
  input                [31:0] samp_freq_i, // (32.0 )
  input        [NF-1:0][31:0] freq_i     , // (32.0 )
  output logic [NF-1:0][63:0] k_arr_o    , // (20.44)
  output logic         [63:0] ang_coef_o , // (20.44)
  output logic         [63:0] ns_coef_o    // (20.44)
);

typedef enum {  
  IDLE ,
  DF   ,
  KARR ,
  ANGC ,
  NS   ,
  VALID    
} state;

state curr_state;
state next_state;

logic [63:0] hcoef = 64'h00027_64D6A161E4F; // (20.44)
// logic [63:0] hcoef = 64'h00011_0A5E353F000; // (20.44)
logic [63:0] pi2   = 64'h00006_487ED5110B4; // (20.44)

logic [63:0] df   ;
logic        rst  ;
logic        srst ;
logic [7 :0] indx ;

logic        start;
logic        done ;
logic [63:0] a    ; // (20.44)
logic [63:0] b    ; // (20.44)
logic [63:0] val  ; // (20.44)

logic         [63:0] num_samp ; // (20.44)
logic         [63:0] samp_freq; // (20.44)
logic [NF-1:0][63:0] freq     ; // (20.44)

assign num_samp  = {num_samp_i[19:0], {44{1'b0}}};
assign samp_freq = {samp_freq_i[19:0], {44{1'b0}}};

genvar gvar;
generate
  for (gvar = 0; gvar < NF; gvar = gvar + 1) begin
    assign freq[gvar] = {freq_i[gvar][19:0], {44{1'b0}}};
  end
endgenerate

assign rst = ~rstn | srst;

divu #(
  .WIDTH(64),
  .FBITS(44) 
) u_divu (
  .clk  (clk  ),
  .rst  (rst  ),
  .start(start),
  .busy (     ),
  .done (done ),
  .valid(     ),
  .dbz  (     ),
  .ovf  (     ),
  .a    (a    ),
  .b    (b    ),
  .val  (val  ) 
);

always_ff @(negedge clk, negedge rstn) begin
  if (!rstn) begin
    curr_state <= IDLE;
  end
  else begin
    curr_state <= next_state;
  end
end

always_ff @(posedge clk, negedge rstn) begin
  if (!rstn) begin
    valid      <= 0;
    k_arr_o    <= 0;
    ang_coef_o <= 0;
    ns_coef_o  <= 0;
    df         <= 0;
    srst       <= 0;
    indx       <= 0;
    start      <= 0;
    a          <= 0;
    b          <= 0;
    next_state <= IDLE;
  end
  else begin
    case (curr_state)
      IDLE : begin
        if (en)
          next_state <= DF;
        else
          next_state <= IDLE;
      end 
      DF : begin
        start <= 1;
        a <= samp_freq;
        b <= num_samp ;
        if (done) begin
          df    <= val;
          start <= 0  ;
          srst  <= 1  ;
          next_state <= KARR;
        end
        else
          next_state <= DF;
      end   
      KARR : begin
        if (indx < NF) begin
          if (!done) begin
            start <= 1;
            srst  <= 0;
            a <= freq[indx];
            b <= df;
          end else begin
            k_arr_o[indx] <= val;
            indx  <= indx + 1;
            start <= 0  ;
            srst  <= 1  ;
          end
          next_state <= KARR;
        end
        else
          next_state <= ANGC;
      end
      ANGC : begin
        start <= 1;
        srst  <= 0;
        a <= pi2;
        b <= num_samp;
        if (done) begin
          ang_coef_o <= val;
          start <= 0;
          srst  <= 1;
          next_state <= NS;
        end
        else
          next_state <= ANGC;
      end
      NS : begin
        start <= 1;
        srst  <= 0;
        a <= hcoef;
        b <= num_samp;
        if (done) begin
          ns_coef_o <= val;
          start <= 0;
          srst  <= 1;
          next_state <= VALID;
        end
        else
          next_state <= NS;
      end   
      VALID : begin
        valid <= 1;
        next_state <= VALID;
      end
      default: next_state <= curr_state;
    endcase
  end
end



endmodule