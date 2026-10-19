#import "../../presets.typ": *

= Dynamic Memory Allocation
#line(length: 100%, stroke: 2pt)

== Linked Lists
Much like Java's objects with references to objects of the same class, C structures can contain pointers to structures of the same type.
- Thus, using structs, we can define linked lists by defining some head node as a *Node pointer*.
```c
  typedef struct node {
    int data;
    struct node *next;
  } Node;
```

If an anonymous structure is preferred, then a *forward declaration* can be used to inform the compiler about Node.

```c
  typedef struct node Node;
  typedef struct {
    int data;
    struct node *next;
  } Node;
```

In memory, the head node can be declared locally while the remaining nodes are stored on the heap space.
- *Dynamic memory allocation is useful for creating or removing new nodes in functions.*
- For instance, memory must be allocated using malloc or calloc when inserting new nodes in a separate function.
  - Nodes with string fields require another malloc or calloc call to free the necessary space for them.
#caution-block[
  The order of the dynamic memory allocation matters. When freeing space, free any string fields before freeing the node.
]


== Operations
#note-block[
  Often, passing the address of the head node is needed for operations in the case that the head node is the target.
]
- Inserting a node.
- Deleting a node.


== Dummy Nodes
*Dummy nodes* contain specific data that makes them distinguishable from other nodes. They can be used to simplify insertions and deletions.
- The head node can point to a dummy node, then operations can start from the dummy node.
- Thus, _the head node's address won't have to be passed as arguments to operation functions._


== Doubly linked Lists
Doubly linked lists are similar, albeit with references to both the previous and next nodes.
```c
  typedef struct node {
    int data;
    struct node *prev;
    struct node *next;
  } Node;
```


== Reallocation
There may be cases where more memory must be manually allocated.
- While allocation could be done by copying the values to some larger allocated memory, the *realloc* function can be used to simplify this process.

Th realloc function reallocates given memory.
```c
  void *realloc(void *p, size_t new_size);
```
$
  "original size" >= "new size"
$
- realloc performs reallocation in place, then returns p.


== Operating on blocks of memory

```c
  void *memcpy(void *dst, void *src, size_t n);
  void *memmove(void *dst, void *src, size_t n);
```
