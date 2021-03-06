# Memory 

| address | memory |
| :--: | :--: |
| max | Stack |
| | (down) |
| | (up) |
| | Heap |
| | Data |
| 0 | Text |

- **Text**: code
- **Data**: global variables
- **Heap**: memory that is dynamically allocated during program run time
- **Stack**: temporary data storage when invoking functions (parameters, return addresses, local variables) 

OS is above 
stack and heap

The total size of stack and heap is fixed, but they can dynamic increase or decrease.

## Main Memory

size of an address: 1 word (8, 16, 32... bits)

A **logical address** is generated by **CPU**

- page

A **physical address** is generated by **MMU**

- frame



## Virtual Memory

**Page Fault**

A page fault occurs when an access to a page that has not been brought into main memory takes place. 

The operating system verifies the memory access, **aborting** the program if it is **invalid**. If it is valid, a **free frame** is located and **I/O** is **requested** to read the needed page into the free frame. Upon completion of I/O, the **process table** and **page table** are **updated** and the **instruction** is **restarted**.

## Page Replacement

![](pictures\page-replacement.png)