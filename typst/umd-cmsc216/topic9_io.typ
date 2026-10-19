#import "../../presets.typ": *

= IO
#line(length: 100%, stroke: 2pt)


== Exit Codes
*Exit codes* are values associated with program terminations. Many important codes are stored in header files.
- stdlib.h - EXIT_SUCCESS (0), EXIT_FAILURE (1)
- sysexits.h - EX_OSERR (71), EX_USAGE (64)


== Errors
*perror* prints a message to standard error describing the last error encountered during a library function or system call.
- If a string is provided, it will be printed before the default error description.
- perror is based on the *errno macro* in errno.h which returns an associated error code. 

#note-block[
  The errno macro is a function call that returns a pointer to a location that is only initialized when there are errors.
]


Using errno as an argument to the *strerror* function, a string library
function, we can generate a string for a specific errno.



== Standard IO
stdio.h contains prototypes and constants for IO routines. IO is mainly *stream-based* and *buffered* for efficiency.
- The function ``` fflush()``` can be used to flush bushers immediately.
There are two kinds of files in standard IO: *text files* and *binary files*.
Accordingly, there are two different stream types associated with each IO file type.

- *Text streams:*
  - Streams composed of text lines, each terminated with a newline character.
  - Library functions can deal with text streams in many ways.
    - Character-oriented IO
    - _Line-oriented IO_
    - _Formatted IO_
- *Binary streams:*
  - Streams composed of just data.


\
== Opening/closing Files
The ``` FILE*``` type represents an open stream.


The *fopen* function opens a file.
```c
  FILE *fopen(char *filename, char *mode);
```
- The arguments to fopen are strings.
- ``` mode``` specifies that access mode. There are several options:
  - *"r"* (read) - the file must already exist.
  - *"w"* (write) - if the file already exists, overwrite it.
  - *"a"* (append) - if the file does not exist, create it.
- Returns NULL if the function fails to open the file.
- fopen's return value is often used in if-statements.

The *fclose* function closes a file and also flushes the output, if needed.
```c
  int fclose(FILE *fp);
```
- Returns 0 on success.
- Failure can occur for numerous reasons, such as OS interruptions.


== Line-oriented IO
The *fgets* function reads characters from the given stream and stores it in the given buffer.
```c
  char *fgets(char *buf, int size, FILE* stream);
```
- The function stops when either:
  - A newline is read.
  - ``` size - 1``` characters are read.
- A null character is always appeneded to strings.
- Unlike gets, fgets includes the newline in ``` buf```.
#note-block[
  Replacing the newline character with the null character may be needed due to printing usually being done with an appended newline character.
]
- NULL is returned on error or EOF.
- On success, ``` buf``` is returned.


The *fputs* function prints a string to a given stream.
```c
  int fputs(const char *str, FILE *stream);
```
- Returns a nonnegative value on success, and returns an EOF otherwise.
- Equivalent functionality to ``` fprintf(stream, "%s", str)```.

\ \
The *feof* function checks if the EOF has been reached for the specified file stream.
```c
  int feof(FILE *stream);
```
- Returns 0 if the EOF has been reached.
- Otherwise, a nonnegative integer is returned.

#note-block[
  *EOF* is a macro defined in stdio.h that represents the end of a file.
]


== Streams
There are three predefined streams in every program:
- *stdin*: standard input (redirect using <)
- *stdout*: standard output (redirect using >)
- *stderr*: standard error (redirect using >&)

The type of steams is ``` FILE*```.

We can use the *fprintf* function to direct output to any specified stream.
```c
  int fprintf(FILE *stream, char *fmt, ...);
```
- When stdin is passed in as the stream, it is analogous to printf.

Accordingly, we can use *fscanf* to read from a given stream.
```c
  int fscanf(FILE *stream, char *fmt, ...);
```
- When stdout is passed in as the stream, it is analogous to scanf.

We can also separately store data from different kinds of streams.
- For instance, we can store the data in stdout and stderr in different text files.
```bash
  a.out < predefined_data.txt > results.txt >& errors.txt
```

We can use the shortcut *ctrl + d* to indicate EOF in Linux. While *ctrl + c* terminates, it does not indicate EOF.


== ``` sscanf()```
The *sscanf* function reads formatted input from ``` str```.
```c
  int sscanf(char str[], char* fmt, ...);
```
- Returns the EOF if nothing is read (``` fmt``` is an empty string/string with only whitespace).
- Otherwise, returns the number of values retrieved.


\
== ``` sprintf()``` and ``` snprintf()```
The *sprintf* function formats the output and stores it in the provided buffer. Afterward, the null byte is added.
```c
  int sprintf(char *buf, char *fmt);
```

The *snprintf* function does the same thing, but only stores up to $n - 1$ characters in the provided buffer before adding the null byte.
```c
  int snprintf(char *buf, size_t limit, char *fmt);
```



== Reading data from strings
To read data from strings, fgets can be used to read a line. Then, the line may be parsed using sscanf.
```c
  #define MAX 1024
  char buf[MAX + 1];
  int a, b;

  while (fgets(buf, MAX + 1, stdin) != NULL) {
    if (sscanf(buf, "%d %d", &a, &b) == 2) {
      printf("%d %d\n", a, b);
      break;
    }
  }
```



== Working with long lines
#note-block[
  Line lengths can vary greatly. Thus, programs either repeatedly read a buffer until they reach the end of a line or enforce a maximum line length.
]


== Shell Programs
Shell programs can be used to interact with the terminal.
- The first line of a shell program, the shebang line, is denoted by \#!. This line can be used to determine the interpreter (syntax) to use to run the pogram.
#pseudocode(booktabs: true, booktabs-stroke: gray)[
  \#!/bin/bash
]
- Lines other than control structures can represent UNIX commands.

The following is an example of a shell program using C shell:
```
  #!/bin/csh

if ($#argv != 1) then
   echo "Usage: mrm <file/directory>"
   exit(1)
endif

echo ""$0" will move "$1" to local tmp_junk_dir"
mv $1 ~/tmp_junk_dir 
if ($? != 0) then
   echo ""
   echo "Terpito your remove script failed"
   echo ""
else
   echo ""
   echo "file/directory moved to ~/tmp_junk_dir" 
   echo ""
endif

```