#import "../../presets.typ": *

= Lab 1 and 2
#line(length: 100%, stroke: 2pt)


== Wildcard and Path symbols
Directories in filepaths are separated by forward slashes (/). Specific characters denote specific directories.
- The slash (/) refers to the root directory.
- The dot (.) refers to the current directory.
- The two dots (..) refer to the parent directory.
- The tilde (\~) refers to the home directory.
- The asterisk (\*) refers to all files in a directory.
  - This can be used alongside a file extension to represent all files of a specific type.
-  The question mark (?) matches one character in a filename.
  - To match numerous characters, multiple question marks can be chained.


== Linux Shell Commands
The following commands are the _essentials_ for writing and executing C programs.
- *Flags* are extra options for commands. They are generally denoted by a dash.
- The up-arrow and down-arrow keys enable you to navigate through previous-ran commands.
- Filename completion can be done using the tab key.
```bash 
  pwd
```
+ ``` pwd``` displays the current direction. Forward slashes separate directories and files.
+ ``` ls``` displays all files and directories in the current directory.
  + ``` ls -F``` will append specific characters to items' names. Particularly, directories are marked with a forward slash.
  + ``` ls -l``` will display results in the long list format.
  + ``` ls -a``` will also include hidden directories and files (including current directory and parent directory).
  + ``` ls -al``` combines the previous two flags.
+ ``` cd ``` changes the directory to the home directory.
  + ``` cd DIRECTORY_NAME``` changes the directory to the specified directory.
  + ``` cd ~``` makes the current directory the home directory.
+ ``` mkdir``` creates a new directory in the current directory.
+ ``` rmdir DIRECTORY``` removes the specified _empty_ directory.
  + ``` rmdir -f -r DIRECTORY``` removes the specified directory, _even if it is non-empty._
+ ``` cp FILE_1 FILE_2``` will create a new file using the data of the first file.
  + ``` cp -r FILE_1 FILE_2``` will create a new file using the data of the first file, but recursively. *This is required when copying folders.*
+ ``` rm FILE``` permanently removes the specified file.
  + ``` rm -r DIRECTORY``` permanently removes the specified directory.
+ ``` mv``` moves files/directories to a directory or renames files/directories.
  + ``` mv FILE_1 FILE_2``` renames the first file to ``` FILE_2```.
  + ``` mv FILE DIRECTORY``` moves the file into the specified directory.
  + ``` mv DIRECTORY_1 DIRECTORY_2``` renames the first directory to ``` DIRECTORY_2 ``` if the second directory doesn't exist. Otherwise, the first directory is moved to the second directory.
+ ``` touch FILE``` updates the access and modification times of FILE to the current time. _If FILE does not exist, then an empty file is created_.
+ ``` man COMMAND``` pulls up the documentation for a given command.
  + ``` man SECTION_NUMBER COMMAND``` pulls up the specified section for the documentation of the given command.
+ ``` diff FILE_1 FILE_2``` shows the differences between ``` FILE_1``` and ``` FILE_2```.
  + ``` diff -bwi FILE_1 FILE_2``` also ignores whitespace differences.
  + ``` diff -Bwi FILE_1 FILE_2``` also ignores whitespace and newline differences.


