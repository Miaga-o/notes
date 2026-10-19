#import "../../presets.typ": *

= Structures
#line(length: 100%, stroke: 2pt)
For those who didn't know, struct is slang for structure.


== The ``` typedef``` Keyword
The keyword ``` typedef``` can be used to define existing types under new names.
```c
  typedef double Dollars;
  Dollars x = 2.5, y = 1.5;
```
- Internally, these are still doubles.
#important-block[
  The naming convention for new type names is to capitalize the first letter of the name.
]
These are different from using symbolic constants to specify types.
- Symbolic constants replace all specified instances during preprocessing.
- *``` typedef``` maps all instances to the specified type during compilation.*
Notably, ``` typedef``` can represent pointer types and array types.
```c
  #define INT_PTR_DEFINE int*
  typedef int* INT_PTR_TYPEDEF

  INT_PTR_DEFINE p1, p2; //Symbolic constants are macros, only 1 pointer
  INT_PTR_TYPEDEF p3, p4; //Both are pointers, typedef creates a type
```

#note-block[
  ``` typedef``` is also usually used with internal types such as ``` uint8_t``` for consistency across different systems.
]



== Struct Definitions
*Structs (structures)* can hold multiple items of different times. Instead of using indices, different items are referred to by their field names (variable names).
- They are similar to classes in Java, albeit without methods.
- They are denoted by the keyword ``` struct```.
- Fields are accessed using a dot (.), similar to accessing public instance variables in Java.
 - This operator is left associative.
\ \
```c
  struct pixel {
    int x, y;
    char color;
  };
```

When creating variables using the struct type, we have to use the ``` struct``` keyword and the name of the struct:
```c
  struct pixel p1;
```



== Struct Initialization
Initializing structs is similar to initializing arrays. Each item in the initializer corresponds to each field in the struct (by order of definition in the struct).
```c
  Pixel p1 = {2, 4, 'b'};
  Pixel p1 = {2};
```
- Any uninitialized fields will be 0, similar to arrays.
- Additionally, we cannot use the struct initializer during assignment.



== Struct Assignment and Comparison
Struct declarations using happen outside of functions and often in header files when used across multiple files.

Struct variables can be assigned to other struct variables of the same struct, copying the bytes for corresponding fields (*shallow copy*).
- Thus, array and pointer fields will be copied, but both struct variables will be referring to the same memory space for their fields.

However, comparison between struct variables of the same struct does not work.

#note-block[
  For struct pointers, assigning different struct types is legal through pointer casting.
]



== Structs and Functions
#important-block[
  Struct arguments are passed by value. Structs can also be returned from functions.
]

```c
  void print_pixel(Pixel p) {
    printf("x: %d, y: %d, color: %c\n", p.x, p.y, p.color);
  } 
  Pixel increase_x_value(Pixel p, int delta) {
    Pixel new_pixel = p;
    new_pixel.x += delta;

    return new_pixel;
  }
```

Using struct pointers can be more efficient, especially when passing large structs are arguments. 



== The ``` ->``` Operator
Given a pointer to a struct, the ``` ->``` operator can be used to reference the struct's fields.
- The dot operator may only be used after dereferencing a struct pointer. Due to precedence, parentheses are needed for this operation.

```c
  Pixel increase_values(Pixel *p, int delta) {
    p->x += delta;
    (*p).y += delta; //Does the same thing, but for the y field

    return new_pixel;
  }
```

#note-block[
  By convention, the arrow operator is preferred over the dot operator for struct pointers. Additionally, whitespace is generally not used between the arrow and its operands.
]



== Struct Storage 
In grace, the size of structs is always divisible largest field's size, and is generally the minimum needed to store everything.
- Thus, structs often use more memory space than the sum of their fields' storage. This extra space can be seen as "padding."
```c
  struct one {
    double b;
    int a;
  } s1;
  printf("%d\n", sizeof(s1)); //Prints 16, but only 12 bytes needed
```

- We can say:
$
  0 <= "padding" < "largest type size"
$

```c
  struct two {
    int b;
    char a;
    short c;
  } s2;
  printf("%d\n", sizeof(s2)); //Prints 8, but only 7 bytes needed
```

The reason for this is memory alignment issues. For instance, integers must begin at 4-byte boundaries.



== Anonymous Structs
```c
  struct {
    int id_number;
    char last_name[10];
    char first_name[10];
    double salary;
  } emp1, emp2;
```

Notice how there is no tag. This is an *anonymous struct*.
- Specifically, this declares two variables: emp1 and emp2.
Omitting the tag means that a _unique struct type_ is created for the listed variables.
- This holds even if other structs with the same fields are created.
- These structs cannot be passed as function arguments.

#important-block[
  To improve syntax, ``` typedef``` can be used with structure definitions. _Anonymous structures are often used with typedef as the tag's functionality is largely replaced by the new type definition._
]


== Unions
*Unions* are defined similarly to structs.
- However, all fields share the same memory space, so they are only as large as the largest field.
- Consequently, only one field may be valid at a time.
 - The unused fields will contain garbage values.
- Accessing fields also requires the dot operator (.).
\ \ \
```c
  typedef union {
    int i;
    double d;
  } Number;
```
A more effective way of using unions is to pair them with enums and structs. Inside a struct, an enum can be used to keep track of the type stored within an accompanying union.
```c
  typedef struct {
    enum {INT, DOUBLE} type;
    union {
      int i;
      double d;
    } value;
  } Number;
```