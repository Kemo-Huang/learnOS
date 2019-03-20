# Learn C Library

## stdio.h

### printf
```c
// print to stdout
int printf(const char* str, ...); 
// print to buffer
int sprintf(char *str, const char *string,...); 
// print to file
int fprintf(FILE *fptr, const char *str, ...);
```

### fopen
```c
FILE *fopen(const char *pathname, const char *mode);
FILE *fdopen(int fd, const char *mode);
FILE *freopen(const char *pathname, const char *mode, FILE *stream);
```

## signal.h

### signal

- SIGABRT
- SIGFPE
- SIGILL
- SIGINT
- SIGSEGV
- SIGTERM

### gerneration

- raise()
  - current process
- kill()
  - specific process

### handler

- signal()
- sigaction()

## fcntl.h

### open

```c
int open(const char *pathname, int flags);
int open(const char *pathname, int flags, mode_t mode);
int creat(const char *pathname, mode_t mode);
int openat(int dirfd, const char *pathname, int flags);
int openat(int dirfd, const char *pathname, int flags, mode_t mode);
```

## math.h

### trigonometric

