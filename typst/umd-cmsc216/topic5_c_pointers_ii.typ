#import "../../presets.typ": *

= C Pointers II
#line(length: 100%, stroke: 2pt)

== Incrementing Pointers
Pointers can be incremented or decremented like integer type variables. This "moves" one element at a time.
- As a result, the number of bytes of memory moved depends on the pointer's type.
- This can be seen with arrays because their elements are in contiguous memory addresses.

#important-block[
  Incrementing pointers only make sense with arrays, which are pointers to their first element.
]

#note-block[
  The postfix operator takes precedent over the dereferencing operator (\*) and the prefix operator (++var).
]
- The dereferencing operator (\*) and prefix operator have the same precedence level, right-to-left associativity.
```c
  int o = 10;
  int *p = &o;
  ++*p; //Increments the value at the location where p points (o = 11), then evaluates incremented value (11)
  *p++; //Evaluates to the value at the location where p points (11), then increments p.
  p--;
  (*p)++ //Evaluates to the value at the location where p points (11), the increments that value (o = 12).
```


== Pointer Arithmetic
By adding an integer $n$ to a pointer, we can get the the address of the $n^"th"$ element past the element where the pointer currently points:

- The only valid forms of pointer arithmetic are:
  - pointer - pointer
  - pointer $plus.minus$ integer
- When two pointers are pointing to the same array, we can determine how far apart they are by finding their difference



== Generic Pointer
*Generic pointers* are pointer variables defined as ``` void*```.
  - The value of any pointer variable can be assigned to a generic pointer.
  - Casting to ``` void*``` is not needed to assign to a generic pointer.

```c
  int x = 20;
  void *p = &x; //This assignment works
```

Generic pointers _cannot be dereferenced_. This is why ``` NULL``` pointers cannot be dereferenced.
- When a pointer is dereferenced, the number of bytes associated with the entity being pointed to must be known.
#important-block[
  The address in the generic pointer must be casted prior to dereferencing.
]

```c
  printf("%d\n", *(int *)p);
```


== Pointers to Pointers
The address of a pointer variable can be obtained.
```c
  int i = 4, j = 6;
  int *p = &i, *q = &j;
  int **r = &p; //Double pointer, points to the address of p
  printf("%d\n", **r); //Double dereferences to access the value of i
  *r = &j; //Dereferences to change the value of p
  printf("%d = %d\n", *p, *q); //Both should print the value of j
```
- This is useful when using pointer variables as parameters

== Arrays versus Pointers
```c
  int nums[3];
```
- Declares an array, allocates 3 ints worth of space, and points the name ``` nums``` to the beginning of this space.
- By itself, ``` nums``` is treated as a *constant pointer* that points to the beginning of the array.
- Recall that ``` nums``` _cannot_ be changed to point to another space.

```c
  int *nump
```
- Declares a pointer, doesn't allocate anything more than the space needed to store an address, then the name ``` numps``` points to this space.
- ``` nump``` can be changed and assigned to.



== Arrays of Pointers
Arrays of pointers are similar to arrays in Java.
```c
  int *nums[3];
```
- An array of 3 pointers to int.
Arrays of pointers are useful when dealing with structures of different sizes.
- Allows pointers to be sorted with moving around lots of memory.
The argv array for a command line is implemented as an array of char pointers.
- Analogous to the args array of Strings in Java.