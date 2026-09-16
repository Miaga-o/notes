#import "../../presets.typ": *

= Arrays
#line(length: 100%, stroke: 2pt)


== Arrays in C (static)
Like Java arrays, all elements in an *array* are of the same type and indexed using the [] operator.
- In C, elements of an array are next to each other in memory as opposed to being an object like in Java.
- Additionally, the user has to keep track of the size, as there is no length property.
- The syntax between them is slightly different too.
#columns[
  ```c
    //array of 5 ints
    int a[5];
  ```
  #colbreak()
  ```java
    //array of 5 ints
    int[] a = new int[5]
  ```
]

Arrays can be viewed as a pointer to the first byte of the first element of the array.
- _The name itself is not a pointer._ Rather, the compiler converts it to a pointer when needed.
- The (constant) size of an array must be known at compile time.

#caution-block[
  An assignment operator cannot be used with two array operands.
]
However, using == and != does work. However, this does _pointer comparison_.



== Array Initialization
When initializing arrays, you can list the elements separated by commas and in-between braces:
```c
  int arr[5] = {1, 2, 3, 4, 5};
```
- Because assignment differs to initialization, the notation above does not work if the array has been previously declared.
- 0s pad the array if the initializer is not complete.
- A size does not need to be provided for an initialized array, as the size is _implicit_.
- Initializers with excessive elements cause compiler errors.



== Symbolic Constants
*Symbolic constants* can be created using the \#define preprocessor directive:
#pseudocode(line-numbering: none, booktabs: true, booktabs-stroke: gray)[
  \#define name value
]

All occurences of _name_ in the program will be replaced with _value_.
- This is useful for defining constants for important values such as array sizes to improve code maintainability.

```c
  #include <stdio.h>
  #define ARRAY_LENGTH 3

  int main() {
    int i, a[ARRAY_LENGTH] = {10, 20, 30};
    printf("[%d", a[0]);
    for (i = 1; i < ARRAY_LENGTH; i++) {
      printf(", %d", a[i]);
    }
    printf("]\n");

    return 0;
  }
```



== Array Parameters
Recall that arrays are pointers to the first byte of the first element of the array.
- The parameter declaration int a[] is equivalent to int \*a.
- Thus, modifications done to an array parameter are done to the passed-in array.
- Consequently, the defined array parameter size does not matter. _Only the type matters._
#note-block[
  Passing in the array parameter's size as a different parameter is common practice.
]