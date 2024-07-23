/* Generic part of mutex specification. This file is meant to be #include'd.
 *
 * Given the mutex lock() and unlock() primitives, this file defines a generic
 * Thread() proctype that loops on locking and unlocking a mutex.
 *
 * It also contains a generic LTL formula.
 */

// Number of threads in the critical section (CS)
byte num_threads_in_cs;

#ifndef __TOPSPIN__
active [NUM_THREADS]
#endif
proctype Thread() {
  byte num_woken = 0; // Used by "futex_wake"
  do
  :: lock();
     num_threads_in_cs++;
     num_threads_in_cs--;
     unlock();
  :: printf("T%d is done\n", _pid) -> break
  od
}

#ifndef __TOPSPIN__
active
#endif
proctype Monitor() {
end:  num_threads_in_cs > 1 -> assert(false);
}

#ifdef __TOPSPIN__
init {
  atomic {
    run Thread();
    run Thread();
#if NUM_THREADS > 2
    run Thread();
#endif
#if NUM_THREADS > 3
    run Thread();
#endif
#if NUM_THREADS > 4
    run Thread();
#endif
#if NUM_THREADS > 5
    run Thread();
#endif
#if NUM_THREADS > 6
#error "NUM_THREADS > 6 - edit macros to support more threads"
#endif
    run Monitor();
  }
}
#endif
