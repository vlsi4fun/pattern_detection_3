// Code your design here
module patt_det #
  (
    parameter PATTERN = 6'b110101,
    parameter WIDTH = 6
  )
  (
  input data_in,
  input input_en,
  input clk,
  input rst,
  output match
);

  reg [WIDTH-1:0]data_temp;
integer i;
always@(posedge clk or negedge rst)
begin
  if(!rst)
    data_temp <= {WIDTH{1'd0}};
  else if(input_en)
    begin
      data_temp[0] <= data_in;
      for(i=1;i<WIDTH;i=i+1)
      begin
        data_temp[i] <= data_temp[i-1];  
      end
    end

end
  
  assign match = (data_temp == PATTERN)?1'd1:1'd0;

  
endmodule
