#import "../../presets.typ": *

= LAB
#line(length: 100%, stroke: 2pt)

== File Parsing
When parsing files using *feof* as a while condition, unintended behaviors may occur when parsing the end of some files.
```c
  while (!feof(input)) {
    fgets(line, MAX + 1, input);
    fprintf(stdout, "%s", line);
  }
```
- If there is no newline before the EOF, the output will not end with a newline.
- If there is a newline before the EOF, the last line will be printed twice because the
Now, if the order of the statements is swapped, the last line will not be printed 


== Preprocessing
Preprocessing is the first stage of compilation.
- The compiler flag -E stops the compilation at the preprocessing stage.

There are several preprocessor predefined symbols:
- *\_\_FILE\_\_* - Represents a string containing the filename where the symbol is being used.
- *\_\_LINE\_\_* - Represents a string containing the line number where the symbol is being used.
- *\_\_DATE\_\_* - Represents a string containing the current date in the system's timezone using the format *Mmm \_d yyyy*.
- *\_\_TIME\_\_* - Represents a string containing the current time in the system's timezone using the format *hh:mm:ss*.


Similarly, the *\#define* directive can be used to create macros denoted by the specified symbolic constant.


=== Conditional Compilation
We can compile programs conditionally to account for different environment.

*\#if*, *\#elif*, and *\#else* are all analogous to their counterparts. *\#endif* is used to end a conditional block.

There are also *preprocessor operators.*
Namely, *defined()* is often used in condition compilation to only
define something if it has not bene previously defined:


```c
  #if !defined(MAX_STR_SIZE)
  #define MAX_STR_SIZE 80
  #endif
```

\
Symbols may also be defined at compile time by using their names as flags:
```shell
  gcc -D MAX_STR_SIZE=100 prog.c
```
_Given that MAX_STR_SIZE is a symbolic constant in prog.c_


=== File Inclusion
Additional files may be included using the *\#define* directive.
- Because inclusions essentially import definitions into the program, including a program that includes another can lead to multi-definitions (error).
- Thus, we can use conditional compilation in files to ensure the safety of their use:
```c
  #if !defined(COORDS)
  #define COORDS

  typedef struct {
    int x, y, z;
  } Coords;

  #endif
```