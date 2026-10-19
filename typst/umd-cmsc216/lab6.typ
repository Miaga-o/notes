#import "../../presets.typ": *

= Lab 6
#line(length: 100%, stroke: 2pt)


== Comma Operator
The comma (,) is an operator with two operands.
- It evaluates the left operand, then the right operand.
- Commas have the lowest precedence of all operators.
```c
  int i;
  i = 1, 2, 3, 4; //i = 1, assignment is an operator with high precedence
  i = (1, 2, 3, 4) //i = 4, parentheses have very high precedence, and commas evaluate left -> right
```


== C Memory Organization
Memory in C from top to bottom is organized as follows:
- *Stack*
  - Local variables and function parameters
  - Grows downward as a function is called, then shrinks upwards as the function returns.
  - Variables disappear when a function returns.
- *Heap*
  - Dynamically allocated memory
  - Grows upward, but generally does not shrink.
  - Variables last until they are deallocated.
- *Data*
  - Globals and statics
- *Text*
  - Compiled code and constants

#note-block[
  The organization here is the binary format for grace. Some systems have different priorities for data and text.
]


== Identifier Scope
There are two main types of scope in C.
- *Block:* variables declared inside blocks is only visible within the block and nested blocks within.
- *File:* identifiers declared outside of any block is visible everywhere in the file _after declaration_.
  - *Global variables* are variables defined in this scope. By default, they are assigned to 0. _Symbolic constants should be used over global variables_.

#important-block[
  Scope applies to both global variables and function names.
]


== Storage
There are two types of storage.
- *Automatic:* Temporarily allocated storage that expires after the end of the block/function call.
  - By default, all block-scoped variables use automatic storage.
- *Static:* Exists for the entire life of the program.
 - By default, global variables use static storage.
 - Initializations to static variables only occur once.

Block-scoped variables can be changed to use static storage.


== Identifier Linkage
Encountering two instances of the same identifier across different files is a common issue.
- *Linkage* is the property of an identifier that determines if multiple declarations of the same identifier refer to the same entity.


There are three types of linkage:
- *None:* All declarations of an identifier refer to different entities. _A variable with no linkage belongs to a single function and cannot be shared_.
- *Internal:* All declarations of an identifier inside a given file refer to the same entity, but declarations across files refer to different entities.
  - The modifier *static* is used to specify internal linkage.
    - If not initialized, a static variable is initialized to 0.
- *External:* All declarations of an identifier refer to the same entity.
  - By default, all global variables and functions have external linkage.
  - The modifier *extern* is used to specify external linkage.


== Enumerated Types
Enumerated types can be used to represent things that only take on certain values. For example, we can represent card suits using enums.
- Denoted using ``` enum```.

By default, the values within an enum are equal to $0, 1, 2 dots$ based on the order of definition
- However, values can be specified as other integers.
```c
  #include <stdio.h>
  int main() {
    enum Suit {
      SPADES, HEARTS,
      DIAMONDS = 42, CLUBS
    };
    enum Suit suit1, suit2;
    suit1 = SPADES;
    suit2 = CLUBS;
    if (suit1 < suit2) {
      printf("Spades are first.\n");
    } else {
      printf("Clubs are first.\n");
    }

    printf("Spades = %d, Clubs = %d\n",
    suit1, suit2);

    return 0;
  }
```



== Lvalues and Rvalues
An *rvalue* is anything that can appear on the right side of an assignment statement.
- Generally any expression.
An *lvalue* is anything that can appear on the left side of an assignment statement.
- Values that represent a location to store a value, such as variables or array entries.

Thus, different sides of an assignment statement are treated differently.


== Typecasting
When two operands of different types are involved in an expression, the lower rank operand will be converted to the type of the higher rank operand.
- For instance, given an expression with a double and float, the float would be converted to a double.
- This is *implicit typecasting.*

The following types are ranked from highest to lowest.
rank.
- long double
- double
- float
- unsigned long int
- long int
- unsigned int
- int
- char, short

_Implicit type casting also occurs during assignment_, however this can often lead to precision loss.

#note-block[
  The compiler may warn you of precision loss due to implicit casting.
]