# Synchronization (同步)



## Race Condition (竞争条件)

它旨在描述一个系统或者进程的输出依赖于不受控制的事件出现顺序或者出现时机。

Race conditions can occur especially in [logic circuits](https://en.wikipedia.org/wiki/Logic_gate), [multithreaded](https://en.wikipedia.org/wiki/Thread_(computing)) or [distributed](https://en.wikipedia.org/wiki/Distributed_computing) software programs.

Depends on **sequence** or **timing of processes** or **threads** for it

Operations upon **shared states** are **[critical sections](https://en.wikipedia.org/wiki/Critical_section)** that must be **[mutually exclusive](https://en.wikipedia.org/wiki/Mutual_exclusion).**

**Computer security**

**FIle systems**

**Networking**

- **IRC** (Internet Relay Chat) **因特网中继聊天**. Multiple users start the same-named channel at the same time

**Life-critical systems**



## Spin Lock (自旋锁)

- Busy waiting

## Mutual exclusion (互斥锁)

该目的通过将代码切片成一个一个的[临界区域](#critical section (临界区域))达成。临界区域指的是一块对公共资源进行访问的代码，并非一种机制或是算法。一个程序、进程、线程可以拥有多个临界区域，但是并不一定会应用互斥锁。

- Mutex is more about resource **protection.**
- Semaphore is more about resource **assignment.**
- Mutex can only be **unlocked by container.**
- Semaphore can be **assigned by anyone**, including caller itself.
- Mutex lock will be **released,** if the holder is terminate.
- Semaphore will **not add up**, if the holder is terminate.



### critical section (临界区域)



## Semaphore (信号量)

##### int sem_init(sem_t *sem, int pshared, unsigned int value);

- **sem**: pointer to unnamed semaphore
- **pshared**: argument indicates whether this semaphore is to be shared between the threads of a process, or between processes.
  - **0** if *&sem* is shared between **threads of a process**. (sem is at the **address** that is visible to all **threads** (e.g. a global variable, a variable in heap)  
  - **1** if *&sem* is shared between **between processes**. (sem is in the **region** of **shared memory**)

##### int sem_wait(sem_t *sem);

sem_wait() **decrements** (locks) the semaphore pointed to by *sem*. 

- If the semaphore's value **> 0**, then the decrement proceeds, and the function returns, immediately. 
- If the semaphore's value currently **= 0,** then the calling process or thread **block**s until either it becomes possible to perform the **decrement** (i.e., the semaphore value rises above zero), or a **signal handler interrupt**s the call.

##### int sem_post(sem_t *sem);

sem_post() **increments** (unlocks) the semaphore pointed to by sem. 

- If the semaphore's value consequently becomes > 0, then another process or thread blocked in a sem_wait call will be woken up and proceed to lock the semaphore.







## Condition Variable (条件变量)

cond = a condition + a mutex

If-else branch balance -> Lock

If-else branch unbalance -> Condition Variable

##### int pthread_cond_wait (pthread_cond_t *, pthread_mutex_t *);

- release lock, put thread to sleep until condition is signaled;
- when thread wakes up again, re-acquire lock before returning

##### int pthread_cond_signal (pthread_cond_t *);

- Wake up at least one of the threads that are blocked on the specified condition variable.
- If more than one thread is blocked on a condition variable, the scheduling policy shall determine the order in which threads are unblocked.