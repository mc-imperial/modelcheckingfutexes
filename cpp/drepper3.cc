class Mutex {
public:
  Mutex() : futex_word(0) {}
  void lock() {
    uint32_t old_value;
    if ((old_value = cmpxchg(futex_word, 0, 1)) != 0) {
      if (old_value != 2)
        old_value = xchg(futex_word, 2); /*@\label{line:drepper3:firstxchg}@*/
      while (old_value != 0) {
        futex_wait(&futex_word, 2);
        old_value = xchg(futex_word, 2); /*@\label{line:drepper3:secondxchg}@*/
      }
    }
  }

  void unlock() {
    if (futex_word.fetch_sub(1) != 1) {
      futex_word.store(0);
      futex_wake(&futex_word, 1);
    }
  }
  
private:
  atomic<uint32_t> futex_word;
};
