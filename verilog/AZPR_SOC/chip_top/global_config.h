`ifndef _GLOBAL_CONFIG_H
`define _GLOBAL_CONFIG_H

// 复位信号极性选择
//`define POSITIVE_RESET
`define NEGATIVE_RESET

// 内存控制信号极性选择
//`define POSITIVE_MEMORY
`define NEGATIVE_MEMORY

`define IMPLEMENT_TIMER
`define IMPLEMENT_UART
`define IMPLEMENT_GPIO

`ifdef POSITIVE_RESET
`define RESET_EDGE posedge
`define RESET_ENABLE    1'b1
`define RESET_DISABLE   1'b0
`else
`define RESET_EDGE negedge
`define RESET_ENABLE    1'b0
`define RESET_DISABLE   1'b1
`endif

`ifdef POSITIVE_MEMORY
`define MEM_ENABLE      1'b1
`define MEM_DISABLE     1'b0
`else
`define MEM_ENABLE      1'b0
`define MEM_DISABLE     1'b1
`endif

`endif
