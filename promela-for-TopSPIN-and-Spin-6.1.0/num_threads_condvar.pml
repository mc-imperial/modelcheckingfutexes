// Total number of threads, and number of waiters, tailored to work with
// vs. without symmetry reduction.

// Sentinel value for invalid thread ID.
#define INVALID_TID 255

#ifndef NUM_THREADS
#define NUM_THREADS 2
#elif (NUM_THREADS < 2) || (NUM_THREADS >= INVALID_TID)
#error "NUM_THREADS must be in [2, INVALID_TID)"
#endif

#ifdef __TOPSPIN__

#if NUM_THREADS == 2
#define WAIT_SIZE 3
#elif NUM_THREADS == 3
#define WAIT_SIZE 4
#elif NUM_THREADS == 4
#define WAIT_SIZE 5
#elif NUM_THREADS == 5
#define WAIT_SIZE 6
#elif NUM_THREADS == 6
#define WAIT_SIZE 7
#elif NUM_THREADS == 7
#define WAIT_SIZE 8
#elif NUM_THREADS == 8
#define WAIT_SIZE 9
#elif NUM_THREADS == 9
#define WAIT_SIZE 10
#elif NUM_THREADS == 10
#define WAIT_SIZE 11
#elif NUM_THREADS == 11
#define WAIT_SIZE 12
#elif NUM_THREADS == 12
#define WAIT_SIZE 13
#elif NUM_THREADS == 13
#define WAIT_SIZE 14
#elif NUM_THREADS == 14
#define WAIT_SIZE 15
#elif NUM_THREADS == 15
#define WAIT_SIZE 16
#else
#error "NUM_THREADS > 15 - edit macros to support more threads"
#error
#endif

#else
#define WAIT_SIZE NUM_THREADS
#endif

// One thread is the signaler, the rest are waiters.
#if NUM_WAITERS != (NUM_THREADS - 1)
#error NUM_WAITERS must be defined, and must be (NUM_THREADS - 1)
#endif
