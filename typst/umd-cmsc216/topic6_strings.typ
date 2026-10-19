#import "../../presets.typ": *

= Strings
#line(length: 100%, stroke: 2pt)

== Strings in C
There is no String type in C. Internally, they are defined as arrays.
- In C, a string is defined as a sequence of characters that si followed by a byte of value 0. This is known as a *null-terminating string*.
  - This 0 byte is often called the *zero byte*, *null byte*, or *NUL*.
  - Represented by the character literal *\\0*.
  - According to the ascii table entry for NULL:
    - ``` man ascii```
    - The \\0 is a 0, and therefore is false in C.
    - Strings are _arrays of characters with a 0 at the end_.
Now, because arrays are contiguous in memory, and chars are one byte each, arrays of chars can be used to contain strings.
#note-block[
  All strings in C are character arrays, but not all  character arrays are strings. This is because strings _require a null byte at the end_.
]



== Initializing Strings
Because strings are closely related to character arrays, we can initialize character arrays to strings _using both string literals and standard array initializers_.
- For instance, the following strings are equivalent.
```c
  char str1[] = "Hello";
  char str2[] = {'H', 'e', 'l', 'l', 'o', '\0'};
```
- Implicitly, the sizes of these character arrays would be 6.
Because strings are character arrays, they cannot be initialized using assignments.
- Instead, we can use the function *strepy* to copy a string.
Additionally, empty spaces in strings are padded by null bytes:
```c
  char a[] = "hello"; //{'h','e','l','l','o','\0'}
  char b[10] = "Maryland"; //{'M','a','r','y','l','a','n', 'd','\0',`\0`}
  char c[1024] = "" //{'\0','\0', ...} (1024 null bytes)
```
We can also use ``` const char *str``` for strings. The const modifier is to enforce pointer safety because we can not reassign ``` str```.


== Defining String Variables
When defining the size of a string variable, the actual number of characters that can be stored is one less than the size.
- For this course, we will use symbolic constants to define the size, then add 1 when declaring strings to account for the null byte.
```c
  #define MAX_LENGTH 80

  char str[MAX_LENGTH + 1];
```


== ``` scanf()```
Recall that the conversion specifier to read a string is %s.
- ``` scanf()``` with %s skips spaces until it finds a non-space character, then keeps reading characters until it reaches a space.
  - Reading lines with spaces between numerous groups of characters requires another function.

#important-block[
  The array must be large enough to read the data, as ``` scanf()``` will not check if the array's size is valid. Thus, it may write characters to memory spaces that it should not be overwriting.
]
- Reading $n$ characters requires an array of size $n+1$ due to the null byte.
  - For instance, 1%s can read one character, but must be written to a char array of at least size 2.
- Because strings are character arrays, associated variables hold the address. Thus, an ampersand is not needed when used as an argument to ``` scanf()```.
#note-block[
  After reading a string, ``` scanf()``` adds a null character to the end.
] 


== Basic String Library Functions
C has standard functions for strings in the string header file. Like stdio.h, a linking flag is not required when compiling the program.
```c
  #include <string.h>
```
The *size_t* type is defined in C as an unsigned integer (unsigned long on grace). It is capable of representing the size of the largest possible object in the computer.
#pagebreak(weak: true)
*strlen* is defined as follows:
```c
  size_t strlen(const char *s);
```
- Returns the length of the given string, _disregarding the null byte_.
- The sizeof operator should not be used to find the length of a string.
  - If passed to other functions, sizeof will return the system's pointer size.
Below is a possible implementation of strlen:
```c
  size_t strlen(const char *s) {
    size_t i;

    for (i = 0; s[i]; i++);

    return i;
  }
```
- The function stops when the null byte is read, so the length of an uninitialized string will be 0.


*strcmp* is defined as follows:
```c
  int strcmp(const char *s1, const char *s2);
```
- Analogous to ``` String::compareTo``` in Java.
  - Returns a negative number if ``` s1``` < ``` s2```.
  - Returns a positive number if ``` s1``` > ``` s2```.
  - Returns 0 if ``` s1``` = ``` s2```.
  - Comparisons are done per character and alphabetically.
Below is a possible implementation of strcmp:
```c
  int strcmp(const char *s1, const char *s2) {
    int i;

    for (i = 0; s1[i] && s2[i]; i++)
      if (s1[i] != s2[i])
        break;
    
    return s1[i] - s2[i];
  }
```

*strcpy* is defined as follows:
```c
  void strcpy(char *dest, const char *src);
```
- Copies the string in ``` src``` to ``` dest```.
- The strings may not overlap.
#caution-block[
  The function does not know if ``` dest``` is large enough to hold the string from ``` src```.
]

Below is a possible implementation of strcopy:
```c
  void strcpy(char *dest, const char *src) {
    int i = 0;

    while (src[i]) {
      dest[i] = src[i];
      i++;
    }
    dest[i] = '\0';
  }
```


== String Literals
*String literals* are denoted by the double quotes.
They are initially part of read-only text.
- String literals containing one character are different from character constants. Specifically, the literal would take up more space due to the null byte.

Additionally, _character arrays are different from character pointers._
```c
  char str1[] = "BANG"; //String variable, mutable
  char *str2 = "BANG"; //Pointer to string literal, immutable
```
- The pointer should be decalred as ``` const char *str2```.
- Either choice works as an argument to a function expecting a character array or character pointer.
- Two pointers to string literals can share the same string.


== ctype.h
The header file *ctype.h* provides functions for character types.
```c
  int isalphanum(int); //Checks if given char is alphanumeric
  int isalpha(int); //Checks if given char is a letter
  int isdigit(int); //Checks if given char is a decimal digit
  int isblank(int); //Checks if given char is a space or tab
  int isspace(int); //Checks if given char is whitespace
  int islower(int); //Checks if given char is a lowercase letter
  int tolower(int); //Returns lowercase version of given char
  int isupper(int); //Checks if given char is an uppercase letter
  int toupper(int); //Returns uppercase version of given char
```
