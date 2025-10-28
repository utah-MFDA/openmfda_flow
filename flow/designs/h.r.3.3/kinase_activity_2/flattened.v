`define FLATTENED(width, name, len) [len*width-1:0] name
`define UNFLATTENED(width, flatten, len, unflatten) \
wire [width-1:0] unflatten [len-1:0]; \
generate \
  genvar i;  \
  for (i = 0; i < len; i = i + 1) begin \
    assign unflatten[i] = flatten[width*(i+1)-1:width*i]; \
  end \
endgenerate

`define UNFLATTEN(width, unflatten, len) \
wire [width-1:0] unflatten [len-1:0]; \
generate \
  genvar i;  \
  for (i = 0; i < len; i = i + 1) begin \
    localparam top = width*(i+1)-1; \
    localparam bottom = width*i; \
    assign unflatten[i]

`define FROM_FLATTENED(flatten) \
      = flatten[top:bottom]; \
  end \
endgenerate

`define FLATTEN(len, width, unflatten, flatten) \
generate \
  genvar i;  \
  for (i = 0; i < len; i = i + 1) begin \
    assign flatten[width*(i+1)-1:width*i] = unflatten[i]; \
  end \
endgenerate
