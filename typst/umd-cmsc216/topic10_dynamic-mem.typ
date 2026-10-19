#import "../../presets.typ": *

= Dynamic Memory Allocation
#line(length: 100%, stroke: 2pt)


== Memory Organization
#note-block[
  Refer to lab 6.
]

While stacks often retain memory, heaps usually delete unused memory. Depending on the system implementation, either the unused memory space or the top of the heap will be used.


== Dynamically Allocated Memory
There are many reasons for dynamically allocating memory.
- Eliminate compile-time limits
  - Data structures' sizes are generally unnown until runtime.
  - Allocating a lot of space to store all possible scenarios can either be error-prone or wasteful.

- *Garbage collection:*
  - The programmer does not have to keep track of objects.
  - However, the execution will be slower because the collection is expensive and needs to be ran periodically.
- *User-managed heap:*



== Memory Management Functions
The *malloc* function allocates the specified amount of memory, if available from the heap.
```c
  void *malloc(size_t amount);
```
- Returns a generic pointer to the beginning of the allocated memory.
  - Usually assigned to an integer pointer.
- Returns NULL if the allocation fails.
- *None of the space is initialized.*

The *calloc* function allocates the amount of memory from the heap analogous to the provided object count and object size.
```c
  void *calloc(size_t count, size_t object_size);
```
- Also returns a generic pointer to the beginning of the allocated memory.
- Returns NULL if the allocation fails.
- *The entire space is initialized to 0.*


The *free* function frees the memory pointed at by the specified pointer.
```c
  void free(void *ptr);
```
- free does not change the provided pointer, but can change the memory it points to.
  - The provided pointer becomes a *dangling pointer*.
  - By convention, these pointers should be set to NULL because they should not be dereferenced.
- The NULL pointer can be safely freed, although it does nothing.

#important-block[
  ``` ptr``` is required to point toward memory previously allocated by either malloc or calloc.
]


== Pointer Aliases
Two pointers can point to the same address. This is known as a *pointer alias*.



== Common Errors
#caution-block[
  + Dereferencing pointers to freed space.
  + Not NULL checking malloc's return value.
  + Not initializing the memory returned by malloc.
  + Attempting to free non-heap memory.
    + The specified pointer should be allocated by malloc or calloc.
  + Freeing something that is not the beginning of a dynamically allocated block.
  + Not allocating enough space.
    ```c
      char str[] = "TEST";
      char *p = malloc(strlen(str)); // Needs +1 to account for null byte.
    ```
  + Using the incorrect size for memory allocation.
  + *Memory leaks:*
    + Occurs when dynamically-allocated memory is not freed. Losing the only pointer to some dynamically-allocated chunk of memory leads to a memory leak.
    + While not immediately fatal, it can waste resources and eventually halt the program.
]
