`timescale 1ns/10ps


module forward_select (
  output logic [63:0] out,

  input  logic [4:0]  src_reg,
  input  logic [63:0] raw_val,

  input  logic         ex_valid,
  input  logic [4:0]   ex_reg,
  input  logic [63:0]  ex_val,

  input  logic         mem_valid,
  input  logic [4:0]   mem_reg,
  input  logic [63:0]  mem_val,

  input  logic         wb_valid,
  input  logic [4:0]   wb_reg,
  input  logic [63:0]  wb_val
);
  always_comb begin
    if (ex_valid && (ex_reg == src_reg))
      out = ex_val;
    else if (mem_valid && (mem_reg == src_reg))
      out = mem_val;
    else if (wb_valid && (wb_reg == src_reg))
      out = wb_val;
    else
      out = raw_val;
  end
endmodule