# Thread

##### int pthread_create(pthread_t *newthread, const pthread_attr_t *attr, void *( *start_routine) (void *), void *arg);

- Create a new thread, starting with execution of START-ROUTINE getting passed ARG. 
- Creation attributed come from ATTR. 
- The new handle is stored in *NEWTHREAD.