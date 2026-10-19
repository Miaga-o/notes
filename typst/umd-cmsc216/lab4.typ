#import "../../presets.typ": *

= Lab 4
#line(length: 100%, stroke: 2pt)
This lab will focus on debugging tools.


== ``` diff``` and I/O redirection
The ``` diff``` command was covered in labs 1 and 2. \
- ``` diff FILE_1 FILE_2```
- As explained prior, it displays differences between two files.
- The ``` -bwi``` flag ignores whitespace that isn't empty lines.
- The ``` -Bwi``` flag ignores whitespace in general.

``` diff``` works best when used with input/output redirection while running a program.
- The less-than symbol (<) allows input to be read from a specified file.
```bash
  a.out < public_test.in
```
- The greater-than symbol (>) allows the output to be written to a specified file.
  - By default, this will not overwrite an existing file. Using (>!) allows the specified file to be overwritten if it exists.
```bash
  a.out > results
  a.out >! results
```

Projects and exercises will be bundled with public test files and their corresponding files. Thus, we can do the following to confirm the validity of the tests.
```bash
  gcc prog.c
  a.out < public0?.in >! results
  diff -U 0 -b results public0?.output
```



== Valgrind
The *valgrind* utility is a tool that provides extra information when compiling a program.
- valgrind can help locate problems in code when there is a segfault.
- valgrind can also detect invalid memory operations.

To use the valgrind utility, compile your program with the ``` -g``` flag, then execute using valgrind.
```bash
  valgrind a.out
  valgrind --track-origins=yes a.out
```
  - The track-origins flag shows where uninitialized values come from.

We can also apply I/O redirection to valgrind.
```bash
  valgrind a.out < data.txt > results
```


== gdb
*gdb* is a C debugger. To use gdb, compile the desired file with the ``` -g``` flag, then execute using ``` gdb```.
```bash
  gcc -g -o prog.c prog
  gdb prog
```

Shortcuts:
- *q* (quit) exits.
- *l* (list) lists all commands.
- *r* (run) runs the program.
- *b* (break) sets a breakpoint.
  - At least one breakpoint is needed to prevent the program from being run to completion.
  - Both line numbers and function names work as locations.
    - ``` b 7``` sets a breakpoint on line 7.
    - ``` b func``` sets a breakpoint at the function ``` func```.
- *p* (print) inspects variables.
- *n* (next) executes a statement/function call.
- *s* (step) executes a statement/function call steps into the function.
- *c* (continue) continues execution.
- *where* lists the stack frame.
  - After a segfault occurs, this can be used to identify the source.
- *frame* changes the stack frame to a given input.
  - ``` frame 1```
- *clear* clears a breakpoint
 - ``` clear 25``` clears a breakpoint on line 25.
- *delete* deletes all breakpoints.
- ^x + a opens a graphical interface

Like when running an executable in the terminal, I/O redirection may be used when running a program in gdb.
```gdb
  r < public01.in > results
```



== splint
*splint* is a tool for statically checking C programs.
- To use it, run the splint command on a C program.
```bash
  splint prog.c
```


== assert
The assert tool is a macro that prints an error message and terminates the program if the provided expression is false. It is defined in the header file *assert.h*.
```c
  #include <assert.h>

  int x = 0;

  assert(x); //terminates program
```

There is a compiler option for disabling assert:
```bash
  gcc -D NDEBUG prog.c
```


== Compiler Options
There are many compiler flags we can use with ``` gcc``` for debugging.
- The fsanitize flag can help identify memory problems such as buffer overflow.
```bash
  gcc prog.c -fsanitize=address
```
