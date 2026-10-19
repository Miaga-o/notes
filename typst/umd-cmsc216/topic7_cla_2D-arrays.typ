#import "../../presets.typ": *

= Command Line Arguments and \ 2-Dimensional Arrays
#line(length: 100%, stroke: 2pt)

== Command Line Arguments
Executing commands such as "ls -l" or "emacs puzzles.c", the various components of the command line are passed as arguments to the program.
- These can be accessed using string parameters, akin to ``` String args[]``` in Java.


== Accessing Command Line Arguments
The program below will print out each argument in the command line on separate lines.
```c
  #include <stdio.h>

  int main(int argc, char *argv[]) {
    int i = 0;

    for (i = 0; i < argc; i++) {
      printf("Arg #%d: %s\n", i, argv[i])
    }
    return 0;
  }
```
Note that we can also declare ``` char *argv[]``` as ``` char **argv```.
- When commands are passed into argv, the null byte is automatically added to the end.
- Below is an example of the contents ``` char *argv[]```.
```c
  char *argv[] = {"prog", "1", "two", "THREE", "-4", NULL};
```
- ``` argv[0]``` is generally the name of the executable. 
- The *atoi* function from stdlib.h is commonly used to convert numeric command line arguments from strings to integers.


== 2-Dimensional Arrays
*2-dimensional arrays* are arrays of arrays.
- When passing 2-dimensional arrays to a function, the size of the second dimension should be specified, but the size of the first dimension is optional.

```c
  #define MAX_LENGTH 80
  #define MAX_LIST_LENGTH 50

  char list1[][MAX_LENGTH + 1];
  char list2[MAX_LIST_LENGTH][MAX_LENGTH + 1];
```


#important-block[
  The compiler needs to know the length of the inner arrays because it needs to know the size to allocate to the outer array's contents.
]
- 2-dimensional rows _are stored in row-major order_, making them similar to 1-dimensional arrays in memory.
  - A two-dimensional array of characters can also be seen as a one-dimensional array of strings.

