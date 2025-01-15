`define Height 217
`define Width_in  102
`define Width_out 128

`define slice_of_Win ((`Width_in+`Tin-1)/`Tin)
`define slice_of_Wout ((`Width_out+`Tout-1)/`Tout)

`define in_scale 2
`define wt_scale 0
`define out_scale 0
`define shift (`in_scale+`wt_scale-`out_scale)

`define clk_period 2