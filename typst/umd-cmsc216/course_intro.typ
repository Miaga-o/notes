#import "../../presets.typ": *

= Course Intro
#line(length: 100%, stroke: 2pt)

*C language* is a high-level language close to assembly.
- Exposes how data is organized in a linear address space.
- *Pointers* demonstrate how variables represent locations in memory.
- Shows system calls provided by the OS.

*Assembly language* shows what hardware can do:
- Instructions processors can execute.
- How function calls work.
- How input/output devices are accessed.

*UNIX operating system*
- Shows how threads, processes, pipes, etc are building blocks for servers and high-performance applications.
- We will use a variant of UNIX called *Linux*.




== Linux Shell Filepaths
Directories in filepaths are separated by forward slashes (/). Specific characters denote specific directories.
- The slash (/) refers to the root directory.
- The dot (.) refers to the current directory.
- The two dots (..) refer to the parent directory.
- The tilde (\~) refers to the home directory.



== Linux Shell Commands
*Flags* are extra options for commands. They are generally denoted by a dash.

The following commands are the _essentials_ for writing and executing C programs.
+ ``` pwd``` displays the current direction. Forward slashes separate directories and files.
+ ``` ls``` displays all files and directories in the current directory.
  + ``` ls -al``` will also include hidden directories and files.
  + ``` ls -F``` will append specific characters to items' names depending. Particularly, directories are marked with a forward slash.
  + ``` ls *.EXTENSION``` displays all files with the provided EXTENSION.
+ ``` cd ``` changes the directory to the home directory.
  + ``` cd DIRECTORY_NAME``` changes the directory to the specified directory.
  + ``` cd ~``` makes the current directory the home directory.
+ ``` mkdir``` creates a new directory in the current directory.
+ ``` cp FILE_1 FILE_2``` will create a new file using the data of the first file.
  + ``` cp -r FILE_1 FILE_2``` will create a new file using the data of the first file, but recursively. *This is required when copying folders.*
+ ``` rm FILE``` permanently removes the specified file.
+ ``` mv``` moves files/directories to a directory or renames files/directories.
  + ``` mv FILE_1 FILE_2``` renames the first file to ``` FILE_2```.
  + ``` mv FILE DIRECTORY``` moves the file into the specified directory.
  + ``` mv DIRECTORY_1 DIRECTORY_2``` renames the first directory to ``` DIRECTORY_2 ``` if the second directory doesn't exist. Otherwise, the first directory is moved to the second directory.
+ ``` rm DIRECTORY``` removes the specified _empty_ directory.
  + ``` rm -f -r DIRECTORY``` removes the specified directory, _even if it is non-empty._
+ ``` man COMMAND``` pulls up the documentation for a given command.
  + ``` man SECTION_NUMBER COMMAND``` pulls up the specified section for the documentation of the given command.
+ ``` diff FILE_1 FILE_2``` shows the differences between ``` FILE_1``` and ``` FILE_2```.
  + ``` diff -bwi FILE_1 FILE_2``` also ignores whitespace differences.
  + ``` diff -Bwi FILE_1 FILE_2``` also ignores whitespace and newline differences.


== Valgrind
The *valgrind* utility is a tool that provides extra information when compiling a program.
- valgrind can help locate problems in code when there is a segfault.
- valgrind can also detect invalid memory operations.
- To use the valgrind utility, compile your program with the ``` -g``` flag, then execute using valgrind. 
  - ``` valgrind a.out```
  - ``` valgrind --track-origins=yes a.out```
    - This shows were uninitialized values come from.
  - ``` valgrind a.out < public01.in```
    - Using valgrind with an input file and input redirection.
  - ``` valgrind a.out < data.txt > results```
    - Using valgrind with input and output redirection.





== emacs
The following shortcuts are important.
- ^X + ^C quits.
- ^X + ^S saves a file.
- ^X + ^F opens a file.
- ^K kills the process.
- ^Y yanks. 
- ^S forward searchs.
- ^R reverse searchs.
- ^\_ undos last change.