#import "../../presets.typ": *

= Lab 8
#line(length: 100%, stroke: 2pt)


== Standard Library (continued)
*getchar* is defined as follows:
```c
  int getchar(void);
```
- Returns the first character in the input stream as an int (ASCII value).
- Returns EOF when the end of the input stream is reached or there is an input error.
- getchar is commonly used to flush out extra newlines or whitespace in the input stream:
```c
  scanf("%1s", str);
  (void) getchar(); //Casting to void discards the resulting expression
```

*putchar* is defined as follows:
```c
  int putchar(int c);
```
- Writes the specified character to the program's output.
- Returns the character's ASCII value as an int.



*ungetc* is defined as follows:
```c
  int ungetc(int c, FILE *stream);
```
drgioaijgiahgauhgaugwri


== String Library (continued)
*strcat* is defined as follows:
```c
  void strcat(char *dest, const char *src);
```
- Concatenates the string in ``` src``` to the end of ``` dest```.
#caution-block[
  Like with strcopy, strcat does not know if ``` dest``` has enough space to support concatenation.
]

*strstr* is defined as follows:
```c
  char *strstr(char *str, char *substring);
```
- Returns a char pointer to the first instance of ``` substring``` in ``` str```.
- If no instance can be found, the NULL pointer is returned.

*strncmp* is defined as follows:
```c
  int strncmp(const char *s1, const char *s2, size_t n);
```
- Does the same thing as strcmp, but only for the first $n$ characters.

*strncpy* is defined as follows:
```c
  void strncopy(char *dest, const char *src, size_t n);
```
- Does the same thing as strcpy, but only for the first $n$ characters of ``` src```.
#caution-block[
  Consequently, strncpy does not always add the null byte. Thus, manual addition to the destination string is often necessary.
]



== Command Line Arguments (continued)
Command line functionality is built into the main function using the parameters ``` int argc``` (argument count) and ``` char **argv``` (argument values).

If we compile some C program to the default executable, the values of the command line parameters may be as follows:
```c
  int argc = 2;
  char **argv = {'.a/out', 'field1'};
```


== 2-dimensional Arrays (continued)
Similar to 1-dimensional arrays, having an incomplete initializer will result in the unprovided values defaulting to 0.
- This is because they are organized similarly to 1-dimensional arrays in memory.

```c
  #define MAX_ROWS 2
  #define MAX_COLS 3

  int arr1[MAX_ROWS][MAX_COLS] = {{1, 2, 3}, {4, 5, 6}}
  // {{1, 2, 3}, {4, 5, 6}}
  int arr2[MAX_ROWS][MAX_COLS] = {{1}, {3}} // {{1, 0, 0}, {3, 0, 0}}
  int arr3[MAX_ROWS][MAX_COLS] = {1, 4, 9, 16, 25, 36}
  // {{1, 4, 9}, {16, 25, 36}}
  int arr4[MAX_ROWS][MAX_COLS] = {5} // {{5, 0, 0}, {0, 0, 0}}
  int arr5[MAX_ROWS][MAX_COLS] = {{6}, 2, 9} // {{6, 0, 0}, {2, 9, 0}}
```