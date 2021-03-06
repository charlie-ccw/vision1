module filtering_EXPAND(
clk,
rst_n,
in_data_valid,
in_data,
out_data_ready,
out_data_valid,
out_data,
in_data_ready,
//intr
);

input clk;
input rst_n;
input in_data_valid;
input [7:0] in_data;
input in_data_ready;
output out_data_ready;
output out_data_valid;
output [7:0] out_data;
//output intr;

wire [7:0] pixel_data_11;
wire [7:0] pixel_data_12;
wire [7:0] pixel_data_13;
wire [7:0] pixel_data_21;
wire [7:0] pixel_data_22;
wire [7:0] pixel_data_23;
wire [7:0] pixel_data_31;
wire [7:0] pixel_data_32;
wire [7:0] pixel_data_33;

wire pixel_data_valid;

wire out_data_valid;
wire out_data_ready;
wire [7:0] out_data;
//wire [7:0] buffer_data;
//wire full_sig;
//wire inreg_ready_filter;
//wire inreg_valid_filter;
//wire [7:0] inreg_data_filter;

//STREAM_REG #(.DATA_WIDTH(8)) in_reg_filter (
//	.clk(clk),
//	.rst_n(rst_n),
//	.ready_out(out_data_ready),
//	.valid_out(inreg_valid_filter),
//	.data_out(inreg_data_filter),
//	.ready_in(inreg_ready_filter),
//	.valid_in(in_data_valid),
//	.data_in(in_data[23:16])
//);

MAX_GEN MATRIX
(
  .clk(clk),
  .rst_n(rst_n),
  .in_valid(in_data_valid),
  .in_ready(in_data_ready),
  .in_data(in_data),
  .out_valid(pixel_data_valid),
  .out_ready(out_data_ready),
  .matrix_11(pixel_data_11),
  .matrix_12(pixel_data_12),
  .matrix_13(pixel_data_13),
  .matrix_21(pixel_data_21),
  .matrix_22(pixel_data_22),
  .matrix_23(pixel_data_23),
  .matrix_31(pixel_data_31),
  .matrix_32(pixel_data_32),
  .matrix_33(pixel_data_33)
);


//buffercontrol_3 BC(
//    .clk(clk),
//    .rst(rst_n ),
//    .in_pixel_data(in_data),
//    .in_pixel_data_valid(in_data_valid),
//	 .in_pixel_data_ready(in_data_ready),
//    .out_pixel_data(pixel_data),
//    .out_pixel_data_valid(pixel_data_valid),
//	 .out_pixel_data_ready(out_data_ready)
//);

assign out_data = ((pixel_data_11 == 8'd255)|(pixel_data_12 == 8'd255)|(pixel_data_13 == 8'd255)
                  |(pixel_data_21 == 8'd255)|(pixel_data_22 == 8'd255)|(pixel_data_23 == 8'd255)
						|(pixel_data_31 == 8'd255)|(pixel_data_32 == 8'd255)|(pixel_data_33 == 8'd255))?8'd255:8'd0;
//
//
//



assign out_data_valid = pixel_data_valid;

					  
//filter_mean  FM(
//    .clk(clk),
//    .in_pixel_data(pixel_data),
//    .in_pixel_data_valid(pixel_data_valid),
//    .out_filtered_data(outfilter_data),
//    .out_filtered_data_valid(outfilter_data_valid)
//);

//
//filter_buffer	filter_buffer_inst (
//	.clock ( clk ),
//	.data ( buffer_data ),
//	.rdreq ( pixel_data_valid & in_data_ready ),
//	.wrreq ( pixel_data_valid ),
//	.full ( full_sig ),
//	.q ( out_data )
//);


//always @(posedge clk)
//begin
//   out_data_valid <= pixel_data_valid;
//	out_data_ready <= in_data_ready | full_sig;
//end
//STREAM_REG #(.DATA_WIDTH(8)) out_reg_filter (
//	.clk(clk),
//	.rst_n(rst_n),
//	.ready_out(inreg_ready_filter),
//	.valid_out(out_data_valid),
//	.data_out(out_data),
//	.ready_in(in_data_ready),
//	.valid_in(pixel_data_valid),
//	.data_in(buffer_data)
//);


//always @(*)
//begin
//    fifo_in = {1'b0, outfilter_data_valid, outfilter_data};
//end
//
//always @(*)
//begin
//    wreq = !full_sig;
//	 rreq = full_sig;
//end
//fifo_filter_mean	fifo_filter_mean_inst (
//	.clock ( clk ),
//	.data ( fifo_in ),
//	.rdreq ( rreq ),
//	.wrreq ( wreq ),
//	.full ( full_sig ),
//	.q ( q_sig )
//	);


//always @(*)
//begin
//    out_data_valid = q_sig[8];
//	 out_data       = q_sig[7:0];
//	 out_data_ready = full_sig;
//end



endmodule