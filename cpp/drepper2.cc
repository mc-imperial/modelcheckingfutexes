class Mutex {
public:
  Mutex() : futex_word(0) {}
  void lock() {
    uint32_t old_value;
    if ((old_value = cmpxchg(futex_word, 0, 1)) != 0) /*@\label{line:drepper2:firstcmpxchg}@*/
      do { /*@\label{line:drepper2:startofloop}@*/
        if (old_value == 2 /*@\label{line:drepper2:checkoldvalue2}@*/
             || cmpxchg(futex_word, 1, 2) != 0) /*@\label{line:drepper2:secondcmpxchg}@*/
          futex_wait(&futex_word, 2); /*@\label{line:drepper2:futexwait}@*/
        old_value = cmpxchg(futex_word, 0, 2); /*@\label{line:drepper2:thirdcmpxchg}@*/
      } while (old_value != 0);
  }
  void unlock() {
    if (futex_word.fetch_sub(1) != 1) { /*@\label{line:drepper2:fetchsub}@*/
      futex_word.store(0); /*@\label{line:drepper2:store0}@*/
      futex_wake(&futex_word, 1); /*@\label{line:drepper2:futexwake}@*/
    }
  }

private:
  atomic<uint32_t> futex_word;
};
