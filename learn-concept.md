# Operating System Basic Concept

## Thread 

### Thread Control Block (TCB)

- **Thread ID** (tid)
- **Stack Pointer** (sp)
- **Program Counter** (pc)
- **Thread state** (running, ready, waiting, start, done)
- **Register values**
- Pointer to Process control block (**PCB**)

![](pictures\thread-lifecycle.png)

## Process

A process is a **program in execution**.

**Heavyweight** process: a process has a single thread of control

### Process Control Block (PCB)

- **Process state**: new, ready, running, waiting, terminated

- **Program counter**: Indicates the address of the next instruction to be executed for this process.

- **Register values**: accumulators, index registers, stack pointers... + condition-code information

- **CPU-scheduling** information: process priority, pointers to scheduling queues...

- **Memory-management** information: value of the base, limit registers, page tables, segment tables

- **Accounting** information: used CPU, real time, time limits, account numbers, job or process numbers...

- **I/O status** information: the list of I/O devices allocated to the process, a list of open files...

![](E:\Operating System\learnOS\pictures\pcb.png)

### State / Life Cycle

#### New 

The process is being created.

#### Ready

The process is waiting to be assigned to a processor.

#### Running

Instructions are being executed.

- system call
- interrupt
- exception

#### Waiting

The process is waiting for some event to occur (such as an I/O completion or reception of a signal)

- **sleep()**: running to **interruptible wait** 

#### Terminated

The process has finished execution.

#### Transition

![process state](pictures/process-state.png)



## Address Space

Programs execute in an address space that is distinct from the memory space of the physical machine.

## Dual Mode Operation

### Kernel

- task list
  - processes are arranged as a double linked list


### Mode Switch

1. System call
2. Interrupt
3. Exception

## Context Switch

A **context switch** is the process of storing the state of a [process](https://en.wikipedia.org/wiki/Process_(computing)) or of a [thread](https://en.wikipedia.org/wiki/Thread_(computing)), so that it can be restored and [execution](https://en.wikipedia.org/wiki/Execution_(computing)) resumed from the same point later. 

Save process state (PCB)

- save TCB 

- address space switch

When to switch:

- **multitasking**: when (1) process makes itself not running (2) preemptive multitasking: may switch out running process. Prevent starvation: timer interrupt.
- **interrupt handling**: a minimal part of context (established at the beginning of interrupt handling) is changed.
- user and kernel **mode switching** in some OS: not necessary.

What to switch:

- Within process: TCB
- Between process: TCB, PCB, file descriptor

Cost: 

- Running **task scheduler**.
- **Save and restore** registers.
- **TLB flushes** (address space switch) when switching threads between different processes. 
- Indirectly cost by sharing **CPU cache** between tasks and **TLB misses**.

## Multi-

### Multiprogramming

There are one or more programs loaded in main memory which are ready to execute. Only one program at a time is able to get the CPU for execution and the others are waiting. 

- maximize the use of CPU time

### Multiprocessing

Multiple processors run at a time

### Multitasking

Multiple tasks share a common processing resource (CPU, memory)

### Multithreading

A process have multiple threads.

- **Concurrency**: At least two threads are **making progress**. It is multithreading in a **single process context**.

- **Parallelism**: At least two threads are **executing simultaneously**. It is multithreading in **multiprocessing** system.