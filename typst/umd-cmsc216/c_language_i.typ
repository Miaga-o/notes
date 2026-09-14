#import "../../presets.typ": *

= C Language I
#line(length: 100%, stroke: 2pt)
For this course, we will be using C99.
- C is not object oriented, so instead of the term _method_, we use *function*.
- To stop a C program, use ctrl + c.



== C versus Java
- C is more performant because it trusts the programmer to manage details such as array bounds, memory leaks, and error checking.
  - Java's garbage collection and constraints hurt performance.
- C is the next level after assembly, thus it's used for writing operating systems such as Unix.
- C compiles to machine code which the processor can directly execute. Java requires an intermediate step of converting to bytecode.
- As mentioned prior, C lacks explicit object-oriented features.



== C Program Example
```C
  #include <studio.h>
  int main() {
    printf("Fear the turtle\n");
    return 0;
  }
```

- ``` #include ``` allows the compiler to include other files (generally .h *header files*) for their function prototypes and type/variable declarations.
  - Standard system files are delimited by *<>* while user-written files are delimited by *""*.
- The ``` main() ``` function is where all C programs begin execution.
  - Return values from this function indicate the end of a program.
  - By convention, an exit code of 0 means that everything went well.



== Compiling a C program
C programs must be compiled to be executed.
- The *gcc* program is will be used to build our programs.
  - ``` gcc SOURCE_FILES```
- The common flags for gcc are as follows:
  - ``` -g``` enables debugging.
  - ``` -Wall``` warns about potential problems.
  - ``` -o FILENAME``` places the executable in the specified file.
  - ``` -c``` compiles to object file (without link).
  - ``` -lm``` compiles with the C math module (if imported).

\
The following are examples of compiling single files and multiple files at once.
```UNIX
  gcc file.c
  gcc -g -Wall -o prog1 prog1.c tools.c
```
To run executables in UNIX, type the name of the executable. In some cases, the executable's name should be preceded by "./".



== Compilation Stages
- *Preprocessor*
  - _Does text-processing of source code._
  - Used to provide declarations shared by different source code.
  - Directives begin with the pound sign, \#, but do not end with a semicolon.
- *Translation*
  - _An object file *(.o)* is created._
  - Ensures individual files are consistent within themselves.
- *Linking*
  - _Joins one or more compiled object files together._
  - _Creates an executable file._ Note that by UNIX convention, executable files lack a filename extension



== Types in C
- char, short, int, long int.
  - These can be signed or unsigned.
- float, double
- \* is a pointer to a variable.
- [] represents arrays of variables.
- union {} represents variables sharing the same space.
- struct {} represents the concatenation of variables.
- enum {} represents named integer values.


#table(columns: (1fr, 1fr, 1fr), inset: 0.6em, fill: (x,y) => if (y == 0) {gray.lighten(70%)}, align: center,
  [*Type name*], [*Minimum size (bytes)*], [*Size on _grace_ (bytes)*],
  [char], [1], [1],
  [short], [2], [2],
  [int], [2], [4],
  [long], [4], [8],
  [float], [4], [4],
  [double], [8], [8],
  [long double], [10], [16]
)



== Numerical Literals
Suffixes can be used to specify a numerical literal's type.
- "L" can be used to specify "long."
- "f" can be used to specify "float."
  - By default, a decimal is a double.

Prefixes can be used to specify bases other than base 10.
- "0" represents octal.
- "0x" represents hexadecimal.



== Variable Declaration
Variables may be declared as follows.
#pseudocode(line-numbering: none, booktabs: true, booktabs-stroke: gray)[
  *typename* var1, var2, ...; 
]

Variables may also be initialized during declaration.
```c
  int x = 6;
```

Even if an initial value is not given, declaration always reserves space for the variable in memory. In the example above, 4 bytes will be reserved even if the initial value of 6 was not given.
- However, it is recommended to give an initial value, as C will not stop you from using an uninitialized variable. In fact, it will use whatever data is in the reserved memory space.



== Arithmetic Operators
The basic arithmetic operators in C are analogous to Java.
- \+ add
- \- subtract
- \/ divide
- % remainder
- \* multiplication
Compound assignment operators are basic arithmetic operators followed by an equals sign.
- +=, -=, /=, %=, \*=
- ++ increment
- \-- decrement
- *(typename)* casting

#note-block[
  Integer division occurs only if both operands are integers. Otherwise, floating point division occurs.
]



== Boolean Type and Operators
_There is no boolean type in C_. Integers are used instead.
- 0 represents *false*.
- Any other integer represents *true*. By convention, this is 1.

Similar to arithmetic operators, the boolean operators are analogous to Java.
- Relational operators: <, >, <=, >=
- Equality operators: ==, !=
- Logical operators: &&, ||, !
Because integers are used instead of a true boolean type, these either evaluate to *0 (false)* or *1 (true)*


#columns(2)[
  ```c
    int i;
    i = (!3) == (4 < 2);
    i = (!2) || (5 && i);
  ```
  #colbreak()
  ```java
    boolean i;
    i = (!true) == (4 < 2);
    i = (!true) || (5 && i);
  ```
]



== Precedence and Associativity
some of these fellas go first. Lowk PEMDAS.



== Assignment Statements
The *assignment operator* in C is  the equals symbol, =.
- It is right associative. A value is returned from the operator to the variable on the left side of the assignment operator.
- _Note, this means that variable assignment is an expression. Consequently, you can write any expressions as individual statements._

Generally, expression statements are most useful with the assignment operators.
```c
  int x, y;
  y = x = 123; //x is assigned to 123, then y is assigned to 123 transitively through x.
  y = 5 + (x = 3); //x is assigned to 3 which yields 3, then y is assigned to 5 + 3 = 8.
```



== Output using ``` printf()```
The ``` printf()``` function is formally declared in stdio.h. It can print strings, which may be formatted with a variable number of expression statements.
#pseudocode(line-numbering: none, booktabs: true, booktabs-stroke: gray)[
  *printf(*"formatstring", expression1, expression2, expression3, ...*)*;
]
The expressions are inserted into the format string using format specifiers. These correspond to each passed-in expression, and decide how each value will be interpreted.
- %d prints an integer in decimal.
- %ld prints a long integer.
- %u prints an unsigned integer.
- %f prints a floating point value.
- %c prints a character.
- %s prints a character string.
- %x prints in hexadecimal.
  - %X makes the letters capital.
- %e prints in exponential form (e notation).
- %% prints the percent symbol.

Like Java, *escape sequences* can be used in strings to specify things that would be otherwise inconvenient to type out.
- \\n creates a new line.
- \\t creates a horizontal tab.



== Input using ``` scanf()```
The ``` scanf()``` function is formally decalred in stdio.h.
#pseudocode(line-numbering: none, booktabs: true, booktabs-stroke: gray)[
  *scanf(*"formatstring", *&*variable1, *&*variable2, *&*variable3, ...*)*;
]
The format string specifies the inputs being read using format specifiers and inserts them into each passed-in variable.
- Format specifiers should match the type of their corresponding variables. If this is not the case, the function will cease.
  - _Most_ specifiers skip leading whitespace.
- Whitespace in the format string simply skips any whitespace input at that point.
- Other characters just tell the function to read the corresponding characters in the input stream.

The ``` scanf()``` function *returns the number of items assigned to variables or the EOF (End of File Marker).*

#note-block[
  The ampersand symbols associated with each variable means that the address of each variable is being retrieved.
]

#caution-block[
  Avoid adding whitespace at the end of the format string of a ``` scanf()``` function.
]



== C Control Statements
Just like Java, C has *if*\/*else*\/*else if*, *for*, *while*, and *switch* statements.

The flow of loops can be controlled using the following keywords:
- *break* immediately ends a loop.
- *continue* skips the remainder of the loop and advances to the next iteration.

*Compound statements* are delimited by {}, and can go anywhere a single statement can. Variables defined within are limited to the scope of the compound statement.



== Additional Formatting Options
We can specify field width, precision, etc alongside format specifiers.
- *\-* left-aligns the output within the field width.
- *0* pads the output with leading zeros when possible.
- *\+* displays a plus sign for positive signed numbers.
- An integer specifies the width (minimum characters).
- An period followed by an integer specifies the precision.
  - Floating-point: number of digits
  - Integer: minimum digits
  - String: maximum characters



== C Functions
*Functions* in C follow the following syntax:
#pseudocode(booktabs: true, booktabs-stroke: gray, line-numbering: none)[
  *returnType* functionName(parameters) {\/\* statements \*\/}
]

They are called as follows:
#pseudocode(booktabs: true, booktabs-stroke: gray, line-numbering: none)[
  functionName(arguments);
]

*Function prototypes* provide information about a function's return type and parameter types, but do not define it.
- The compiler can use them to verify the correctness of function calls.
- Thus, they allow functions to be defined after the main function in a C program.
#pseudocode(booktabs: true, booktabs-stroke: gray, line-numbering: none)[
  *returnType* functionName(parameterTypes);
]

#important-block[
  Unlike Java, functions *cannot be overloaded.*
]

#caution-block[
  Previously, variables in compound statements could only be declared at the top. In C99, mixed declarations are now allowed. This primarily affected for-loops.
]