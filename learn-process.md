# Learn Process in Operating System

## Execute 
execl, execlp, execle, execv, execvp, execvpe  

Interface  | Attribute | Value
-- | -- | --
execl(), execle(), execv() | Thread safety | MT-Safe
execlp(), execvp(), execvpe() | Thread safety | MT-Safe env

### Fork
```c
#include<stdio.h>
#include<unistd.h>
#include<sys/wait.h>

void create_child() {
    pid_t cpid;
    if (fork() == 0){
        execl("./hello","./hello",NULL);
    }else{
        wait(NULL);
        printf("I'm the parent.\n");
    }
}
```

### Duplicate (File Descriptor)
- int dup(int oldfd);
  - creates a copy of the file descriptor oldfd, using the lowest-numbered unused file descriptor for the new descriptor. 
- int dup2(int oldfd, int newfd);
  - uses the file descriptor number specified in newfd.  
  - If the file descriptor newfd was previously open, it is silently closed before being reused.
- int dup3(int oldfd, int newfd, int flags);
  - The caller can force the close-on-exec flag to be set for the new file descriptor by specifying O_CLOEXEC in flags.



