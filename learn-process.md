# Learn Process in Operating System

## Fork

All the processes are created by the first parent process 'init'. 

### init
- pid = 1
- /sbin/init

In unix, the only way to new a child process is fork().

### The kernel space is updated

- copy data from parent
- update children list of parent 
- update child PID
- update child running time
- update child's pointer to parent

### The user space is updated

- return value for parent = child PID
- return value for child = 0

### opened file array

Share the same terminal output stream.


## Execute 

Replace the parent process with the other process. PID doesn't change. The executing process never returns to the origin one.  

1. change PCB
2. change user space

execl, execlp, execle, execv, execvp, execvpe  

Interface  | Attribute | Value
-- | -- | --
execl(), execle(), execv() | Thread safety | MT-Safe
execlp(), execvp(), execvpe() | Thread safety | MT-Safe env

## Wait

### suspend  
1. wait for children terminate
2. wait for SIGCHLD

### return immediately
- no child

```c
#include <sys/wait.h>
pid_t wait(int *wstatus);
// The wait() system call suspends execution of the calling process until one of its  children terminates.
pid_t waitpid(pid_t pid, int *wstatus, int options);
// waitpid(-1, &wstatus, 0); 
```

## An Example 

```c
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
int main(void) {
    if (fork() == 0){
        execl("/bin/ls","/bin/ls",NULL);
    } else {
        wait(NULL);
        printf("I'm the parent.\n");
    }
    return 0;
}
```

## Duplicate (File Descriptor)

```c
#include <unistd.h>
int dup(int oldfd);
// It creates a copy of the file descriptor oldfd, using the lowest-numbered unused file descriptor for the new descriptor. 
int dup2(int oldfd, int newfd);
// It uses the file descriptor number specified in newfd. If the file descriptor newfd was previously open, it is silently closed before being reused.
int dup3(int oldfd, int newfd, int flags);
// The caller can force the close-on-exec flag to be set for the new file descriptor by specifying O_CLOEXEC in flags.
```

## Process Control Block (PCB)

PCB is a **data structure** in the operating system kernel containing the information needed to manage the scheduling of a particular process.  
"the manifestation of a process in an operating system."

## Pipe

## Time 

### User Time

- CPU time spent in user-mode code
- user-space memory

### System Time

- CPU time spent in the kernel
- kernel-space memory

### Real Time

total elapsed time

- real time = user time + sys time
- real time > user time + sys time
  - Heavy I/O activity
  - Lack of CPU
- real time < user time + sys time
  - multithreading

## Exit

exit()
- clean up kernel-space memory
- clean up uesr-space memory
- kernel send SIGCHLD signal to parent
- child is zombie
wait()
- register signal handling function

## Zombie Process

PID is still in the task list

## Orphan Process

Should be re-parenting

## Signal 

kill() 
