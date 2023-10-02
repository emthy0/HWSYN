all:
	iverilog -o nano_sc_system -c file_list.txt -s nano_sc_system
sim:
	./nano_sc_system

test:
	iverilog -o alu_test -c file_list.txt -s alu_test
	./alu_test

prepare:
	curl https://www.cp.eng.chula.ac.th/~krerk/books/Computer%20Architecture/nanoLADA/nano_sc_system.v  -o nano_sc_system.v
	curl https://www.cp.eng.chula.ac.th/~krerk/books/Computer%20Architecture/nanoLADA/nanocpu.v  -o nanocpu.v
	curl https://www.cp.eng.chula.ac.th/~krerk/books/Computer%20Architecture/nanoLADA/adder.v  -o adder.v
	curl https://www.cp.eng.chula.ac.th/~krerk/books/Computer%20Architecture/nanoLADA/alu.v  -o alu.v
	curl https://www.cp.eng.chula.ac.th/~krerk/books/Computer%20Architecture/nanoLADA/control.v  -o control.v
	curl https://www.cp.eng.chula.ac.th/~krerk/books/Computer%20Architecture/nanoLADA/regfile.v  -o regfile.v
	curl https://www.cp.eng.chula.ac.th/~krerk/books/Computer%20Architecture/nanoLADA/extender.v  -o extender.v
	curl https://www.cp.eng.chula.ac.th/~krerk/books/Computer%20Architecture/nanoLADA/mux2_1.v  -o mux2_1.v
	curl https://www.cp.eng.chula.ac.th/~krerk/books/Computer%20Architecture/nanoLADA/micropc.v  -o micropc.v
	curl https://www.cp.eng.chula.ac.th/~krerk/books/Computer%20Architecture/nanoLADA/memory.v  -o memory.v
	curl https://www.cp.eng.chula.ac.th/~krerk/books/Computer%20Architecture/nanoLADA/data.list  -o data.list
	curl https://www.cp.eng.chula.ac.th/~krerk/books/Computer%20Architecture/nanoLADA/rom.v  -o rom.v
	curl https://www.cp.eng.chula.ac.th/~krerk/books/Computer%20Architecture/nanoLADA/prog.list  -o prog.list
	curl https://www.cp.eng.chula.ac.th/~krerk/books/Computer%20Architecture/nanoLADA/prog1.list  -o prog1.list
	curl https://www.cp.eng.chula.ac.th/~krerk/books/Computer%20Architecture/nanoLADA/prog2.list  -o prog2.list
	curl https://www.cp.eng.chula.ac.th/~krerk/books/Computer%20Architecture/nanoLADA/prog3.list  -o prog3.list

