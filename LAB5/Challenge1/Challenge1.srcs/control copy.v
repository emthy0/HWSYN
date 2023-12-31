`timescale 1ns / 1ps
//-------------------------------------------------------
// File name    : control.v
// Title        : Control Unit.
// Library      : nanoLADA
// Purpose      : Computer Architecture, Design and Verfication
// Developers   : Krerk Piromsopa, Ph. D.
//              : Chulalongkorn University.

module control(	
	sel_pc,
	sel_addpc,
	sel_wr,
	sel_b,
	sel_data,
	reg_wr,
	mem_wr,
	ext_ops,
	alu_ops,
	opcode,
	z_flag
	);
output reg sel_pc;
output reg sel_addpc;
output reg sel_wr;
output reg sel_b;
output reg sel_data;
output reg reg_wr;
output reg mem_wr;
output reg [1:0] ext_ops;
output reg [2:0] alu_ops;
input [5:0] opcode;
input z_flag;

localparam ADD	=11'b00000000000;
localparam SUB	=11'b00000000001;
localparam OR		=11'b00000000010;
localparam AND	=11'b00000000011;
localparam XOR	=11'b00000000100;
localparam COM	=11'b00000000101;
localparam NOT	=11'b00000000110;
// localparam JMP	=11'b00000000000;

// sel_pc
always @(opcode)
begin
	case (opcode)
		JMP : sel_pc=1;
		default : sel_pc=0;
	endcase
end

// sel_addpc
always @(opcode or z_flag)
begin
	case (opcode)
		BEQ : sel_addpc=z_flag;
		default : sel_addpc=0;
	endcase
end

// sel_wr
always @(opcode)
begin
	case (opcode)
		ORI : sel_wr=1;
		ORUI : sel_wr=1;
		LW : sel_wr=1;
		default : sel_wr=0;
	endcase
end

// sel_b
always @(opcode)
begin
	case (opcode)
		ORI : sel_b=1;
		ORUI : sel_b=1;
		LW : sel_b=1;
		SW : sel_b=1;
		default : sel_b=0;
	endcase
end

// sel_data
always @(opcode)
begin
	case (opcode)
		LW : sel_data=1;
		default : sel_data=0;
	endcase
end

// reg_wr
always @(opcode)
begin
	case (opcode)
		ORI : reg_wr=1;
		ORUI : reg_wr=1;
		ADD : reg_wr=1;
		LW : reg_wr=1;
		default : reg_wr=0;
	endcase
end

// mem_wr
always @(opcode)
begin
	case (opcode)
		SW : mem_wr=1;
		default : mem_wr=0;
	endcase
end

// ext_ops
always @(opcode)
begin
	case (opcode)
		ORUI : ext_ops=2'b10;
		LW : ext_ops=2'b01;
		SW : ext_ops=2'b01;
		BEQ : ext_ops=2'b01;
		default : ext_ops=2'b00;
	endcase
end

// alu_ops
always @(opcode)
begin
	case (opcode)
		ADD 	: alu_ops=3'b000;
		SUB 	: alu_ops=3'b001;
		OR 		: alu_ops=3'b010;
		AND		:	alu_ops=3'b011;
		XOR		:	alu_ops=3'b100;
		COM		:	alu_ops=3'b101;
		NOTA	: alu_ops=3'b110;
		NOTB	: alu_ops=3'b111;
		default : alu_ops=3'b000;
	endcase
end

endmodule
	