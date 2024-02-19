HOW TO ASSEMBLE

HOW TO USE DEBUGGER

- gdb exe_name
- set format to intel; set disassembly-flavor intel
- disassemble the start function; disas _start
- You can use r (just the letter r) to run the program
- b*function_name+breakpoint creates a breakpoint at that "address"
- i r register_name; this checks the value of the register after the breakpoint
- to continue the next instruction after the breakpoint, use ni
