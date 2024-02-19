HOW TO ASSEMBLE

HOW TO USE DEBUGGER

- gdb exe_name
- set format to intel; set disassembly-flavor intel
- disassemble the start function; disas _start
- You can use r (just the letter r) to run the program
- b*function_name+breakpoint creates a breakpoint at that "address"
- i r register_name; this checks the value of the register after the breakpoint
- to continue the next instruction after the breakpoint, use ni
- laging pass by value kapag register to register, nagiiba lang sya if address ng variable ang pinasa mo
- the sizes of the stuff you move must be of the same size
