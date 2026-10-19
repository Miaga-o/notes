#import "../../presets.typ": *

= C Pointers
#line(length: 100%, stroke: 2pt)


== The ``` sizeof``` operator
The ``` sizeof``` operator is _unary_, and evaluates to the bytes needed to store the operand.
- The operand can be either an expression or a type name.
#note-block[
  The expression is not evaluated.
]
- Return type is long.
- For example:
```c
  int i = 67;
  printf("%ld\n", sizeof(i)); //Prints 4 (on grace)
  printf("%ld\n", sizeof(unsigned char)); //Prints 1
  printf("%ld\n", sizeof(++i)); //Prints 4 (on grace)
  printf("%ld\n", i); //Prints 67, the line 4 expression isn't evaluated
```



== Pointers
A *pointers* is a memory address or reference to a variable. They have two attributes:
- *Address:* Address of a byte of memory.
- *Type:* Type of the data starting at the address.
- A *pointer variable* is a variable that holds a pointer value.
  - Many times, they are referred to as just _pointers_.

Variables are denoted as pointers with an asterix (\*) before it:
```c
  int *p; //Creates a variable ip, whose type is "pointer to int"
```
- Due to how they're denoted, the following are also equivalent:
  - ``` int*p```
  - ``` int * p```
  - ``` int* p```
An ampersand (&) before an entity _denotes pointer to it_ (specifically, the address of its first byte).


The _address of an int variable_ can be the value of an _int pointer variable._
- We can access the entity a pointer variable points to.
- The type attribute of a pointer is used by the compiler when generating object code, but the attribute itself is not stored in object code.

```c
  int i = 6;
  int *p;
  p = &i;
  printf("%d %d\n", *p, *(&i));
```

While addresses look like integers, they are a different type. For instance, the following does not compile:
```c
  int x = 20;
  int *m = x;
```

#note-block[
  The format specifier for addresses is ``` %p```, although it requires a null pointer variable for use in ``` printf()```. Thus, casting using ``` (void *)``` can be used.
]

#note-block[
  The size of a pointer depends on the system. Pointers in a 32-bit system are 4 bytes and pointers in a 64-bit system are 8 bytes.
]



== Dereferencing a Pointer
An asterix (\*) before a pointer _dereferences the pointer_.

By dereferencing a pointer variable, we can access the value present at the address being pointed to.
```c
  int i = 6, j, *p;
  p = &i; 
  j = *p; //Dereferences p, j is set to 6
  *p = 4; //Points to the address of 4
```



== Pointers as Parameters
#important-block[
  Everything in C is passed by value.
]
Below is a good example of a function that needs pointers as parameters

```c
  void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
  }
```

Because things are passed by value, pointers are needed to change the values of the variables provided in the function call.



== Garbage Pointers
When a pointer is defined, it points to the address associated with the memory location allocated for the pointer variable. If pointed to an address where no value has been initialized:
- A *segmentation fault* (*segfault*), accessing a memory location that you don't have permission to access.
- A *bus error*, violating the computer's memory alignment policies.
- A *silent failure*, where everything appears to run correctly, but the value being accessed may change later on.



== Pointers to Local Variables
#caution-block[
  Do not return pointers to local variables. Once the function call has finished, the memory used by the variable is not supposed to be accessed.
]



== ``` NULL``` Pointer
A *NULL pointer* points to the address 0, where nothing is allowed to be accessed.
- This is defined in stddef.h, which is included by many header files.
```c
  #define NULL ((void*)0)
```
- *NULL* is analogous to *null* in Java.
  - Dereferencing a NULL pointer usually results in a segfault, as you are generally not supposed to access the address 0.
- NULL can be assigned to any kind of pointer variable, so checking whether or not a pointer is NULL prior to dereferencing is safest.




== The ``` const``` modifier
The ``` const``` modifier indicates that a variable cannot be changed. This is enforced by the compiler. The order of the type specifier and the modifier does not matter.
```c
  int const k = 4;
  const int m = 5;
  k++; //Error
  m++; //Error
```

The order of the type specifier and the modifier _does matter when using pointers_:
```c
  int i = 4, j = 5;
  const int *p = &i; //Pointer variable to constant int
  int * const q = &j; //Constant pointer variable to int

  p = &j; //WORKS
  *p += 5; //ERROR
  q = &i; //ERROR
  *q += 23; //WORKS
```

- If a pointer variable points to a constant value, then it is that value that cannot be changed.
- If a constant pointer variable points to a value, then it is the pointer value that cannot be changed.

