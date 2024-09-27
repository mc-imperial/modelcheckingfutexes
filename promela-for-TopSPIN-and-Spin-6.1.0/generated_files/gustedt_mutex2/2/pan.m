#define rand	pan_rand
#if defined(HAS_CODE) && defined(VERBOSE)
	cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: /* STATE 1 - ../../../mutex_generic.pml:46 - [(run Thread())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][1] = 1;
		if (!(addproc(II, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: /* STATE 2 - ../../../mutex_generic.pml:47 - [(run Thread())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][2] = 1;
		if (!(addproc(II, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: /* STATE 3 - ../../../mutex_generic.pml:75 - [(run Monitor())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][3] = 1;
		if (!(addproc(II, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: /* STATE 5 - ../../../mutex_generic.pml:77 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][5] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Monitor */
	case 7: /* STATE 1 - ../../../mutex_generic.pml:39 - [((num_threads_in_cs>1))] (4:0:0 - 1) */
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((int)now.num_threads_in_cs)>1)))
			continue;
		/* merge: assert(0)(0, 2, 4) */
		reached[1][2] = 1;
		spin_assert(0, "0", II, tt, t);
		_m = 3; goto P999; /* 1 */
	case 8: /* STATE 4 - ../../../mutex_generic.pml:41 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][4] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Thread */
	case 9: /* STATE 3 - ../../../atomics.pml:3 - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][3] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_000_0: /* 2 */
		((P0 *)this)->_2_cur = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:cur", ((int)((P0 *)this)->_2_cur));
#endif
		;
S_001_0: /* 2 */
		now.futex.word = ( ((((int)now.futex.word)==0)) ? (((1<<7)|1)) : (((int)now.futex.word)) );
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
		goto S_009_0;
S_009_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 10: /* STATE 5 - ../../../gustedt_mutex2.pml:24 - [((cur==0))] (77:0:1 - 1) */
		IfNotBlocked
		reached[0][5] = 1;
		if (!((((int)((P0 *)this)->_2_cur)==0)))
			continue;
		/* dead 1: _2_cur */  (trpt+1)->bup.oval = ((P0 *)this)->_2_cur;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_2_cur = 0;
		/* merge: printf('T%d locks mutex on fast path\\n',_pid)(77, 6, 77) */
		reached[0][6] = 1;
		Printf("T%d locks mutex on fast path\n", ((int)((P0 *)this)->_pid));
		/* merge: goto acquired_mutex(77, 7, 77) */
		reached[0][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 11: /* STATE 11 - ../../../gustedt_mutex2.pml:28 - [.(goto)] (0:31:0 - 1) */
		IfNotBlocked
		reached[0][11] = 1;
		;
		/* merge: .(goto)(0, 32, 31) */
		reached[0][32] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 12: /* STATE 9 - ../../../gustedt_mutex2.pml:26 - [printf('T%d fails to lock mutex on fast path\\n',_pid)] (0:31:0 - 1) */
		IfNotBlocked
		reached[0][9] = 1;
		Printf("T%d fails to lock mutex on fast path\n", ((int)((P0 *)this)->_pid));
		/* merge: .(goto)(31, 11, 31) */
		reached[0][11] = 1;
		;
		/* merge: .(goto)(0, 32, 31) */
		reached[0][32] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 13: /* STATE 16 - ../../../gustedt_mutex2.pml:34 - [(((1<<7)&cur))] (24:0:1 - 1) */
		IfNotBlocked
		reached[0][16] = 1;
		if (!(((1<<7)&((int)((P0 *)this)->_2_cur))))
			continue;
		/* merge: cur = ( (((((1<<7)-1)&cur)==0)) -> ((2+1)) : (((((1<<7)-1)&cur)-1)) )(0, 17, 24) */
		reached[0][17] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_cur);
		((P0 *)this)->_2_cur = ( (((((1<<7)-1)&((int)((P0 *)this)->_2_cur))==0)) ? ((2+1)) : (((((1<<7)-1)&((int)((P0 *)this)->_2_cur))-1)) );
#ifdef VAR_RANGES
		logval("Thread:cur", ((int)((P0 *)this)->_2_cur));
#endif
		;
		/* merge: .(goto)(0, 20, 24) */
		reached[0][20] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 14: /* STATE 23 - ../../../atomics.pml:3 - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][23] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_020_0: /* 2 */
		((P0 *)this)->_2_prev = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:prev", ((int)((P0 *)this)->_2_prev));
#endif
		;
S_021_0: /* 2 */
		now.futex.word = ( ((((int)now.futex.word)==((int)((P0 *)this)->_2_cur))) ? (((1<<7)|(((int)((P0 *)this)->_2_cur)+1))) : (((int)now.futex.word)) );
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
		goto S_028_0;
S_028_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 15: /* STATE 25 - ../../../gustedt_mutex2.pml:39 - [((cur==prev))] (0:0:2 - 1) */
		IfNotBlocked
		reached[0][25] = 1;
		if (!((((int)((P0 *)this)->_2_cur)==((int)((P0 *)this)->_2_prev))))
			continue;
		/* dead 1: _2_cur */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->_2_cur;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_2_cur = 0;
		/* dead 1: _2_prev */  (trpt+1)->bup.ovals[1] = ((P0 *)this)->_2_prev;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_2_prev = 0;
		_m = 3; goto P999; /* 0 */
	case 16: /* STATE 28 - ../../../gustedt_mutex2.pml:40 - [cur = prev] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][28] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_cur);
		((P0 *)this)->_2_cur = ((int)((P0 *)this)->_2_prev);
#ifdef VAR_RANGES
		logval("Thread:cur", ((int)((P0 *)this)->_2_cur));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: /* STATE 41 - ../../../lockbit.pml:8 - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][41] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_033_0: /* 2 */
		((P0 *)this)->_2_cur = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:cur", ((int)((P0 *)this)->_2_cur));
#endif
		;
S_038_0: /* 2 */
S_034_0: /* 2 */
		if (!(((((1<<7)-1)&((int)now.futex.word))==(2+1))))
			goto S_038_1;
S_035_0: /* 2 */
		now.futex.word = ( ((((1<<7)&((int)now.futex.word))!=0)) ? (0) : (((1<<7)|0)) );
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
		goto S_039_0;
S_038_1: /* 3 */
S_036_0: /* 2 */
		/* else */;
S_037_0: /* 2 */
		now.futex.word = (((int)now.futex.word)+1);
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
		goto S_039_0;
S_038_2: /* 3 */
		Uerror("blocking sel in d_step (nr.0, near line 10)");
S_039_0: /* 2 */
		goto S_042_0;
S_042_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 18: /* STATE 43 - ../../../gustedt_mutex2.pml:45 - [cur = (cur+1)] (0:74:1 - 1) */
		IfNotBlocked
		reached[0][43] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_cur);
		((P0 *)this)->_2_cur = (((int)((P0 *)this)->_2_cur)+1);
#ifdef VAR_RANGES
		logval("Thread:cur", ((int)((P0 *)this)->_2_cur));
#endif
		;
		/* merge: .(goto)(0, 75, 74) */
		reached[0][75] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 19: /* STATE 44 - ../../../gustedt_mutex2.pml:49 - [(((1<<7)&cur))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][44] = 1;
		if (!(((1<<7)&((int)((P0 *)this)->_2_cur))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 20: /* STATE 50 - ../../../futex.pml:17 - [D_STEP] */
		if (!(boq == -1 && (((int)now.futex.word)==((int)((P0 *)this)->_2_cur))))
			continue;
		sv_save();
		reached[0][50] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_044_0: /* 2 */
		if (!((((int)now.futex.word)==((int)((P0 *)this)->_2_cur))))
			Uerror("block in d_step seq");
S_045_0: /* 2 */
		Printf("T%d futex_wait, value match: %d; sleep\n", ((int)((P0 *)this)->_pid), ((int)now.futex.word));
S_046_0: /* 2 */
		spin_assert( !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 4) ])), " !(futex.wait[_pid])", II, tt, t);
S_047_0: /* 2 */
		now.futex.wait[ Index(((P0 *)this)->_pid, 4) ] = 1;
#ifdef VAR_RANGES
		logval("futex.wait[_pid]", ((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 4) ]));
#endif
		;
S_048_0: /* 2 */
		now.futex.num_waiting = (((int)now.futex.num_waiting)+1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		goto S_052_0;
S_052_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 21: /* STATE 53 - ../../../futex.pml:27 - [D_STEP] */
		if (!(boq == -1 &&  !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 4) ]))))
			continue;
		sv_save();
		reached[0][53] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_050_0: /* 2 */
		if (!( !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 4) ]))))
			Uerror("block in d_step seq");
S_051_0: /* 2 */
		Printf("T%d has woken\n", ((int)((P0 *)this)->_pid));
		goto S_057_0;
S_057_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 22: /* STATE 56 - ../../../futex.pml:31 - [D_STEP] */
		if (boq != -1 || (trpt->o_pm&1))
			continue;
		sv_save();
		reached[0][56] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_053_0: /* 2 */
		/* else */;
S_054_0: /* 2 */
		Printf("T%d futex_wait, value mismatch: %d vs. %d; do not sleep\n", ((int)((P0 *)this)->_pid), ((int)now.futex.word), ((int)((P0 *)this)->_2_cur));
		goto S_057_0; /* ';' */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 23: /* STATE 60 - ../../../gustedt_mutex2.pml:51 - [cur = ( (((((1<<7)-1)&cur)==0)) -> ((2+1)) : (((((1<<7)-1)&cur)-1)) )] (0:67:1 - 3) */
		IfNotBlocked
		reached[0][60] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_cur);
		((P0 *)this)->_2_cur = ( (((((1<<7)-1)&((int)((P0 *)this)->_2_cur))==0)) ? ((2+1)) : (((((1<<7)-1)&((int)((P0 *)this)->_2_cur))-1)) );
#ifdef VAR_RANGES
		logval("Thread:cur", ((int)((P0 *)this)->_2_cur));
#endif
		;
		/* merge: .(goto)(0, 63, 67) */
		reached[0][63] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 24: /* STATE 66 - ../../../atomics.pml:3 - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][66] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_063_0: /* 2 */
		((P0 *)this)->_2_prev = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:prev", ((int)((P0 *)this)->_2_prev));
#endif
		;
S_064_0: /* 2 */
		now.futex.word = ( ((((int)now.futex.word)==((int)((P0 *)this)->_2_cur))) ? (((1<<7)|((int)((P0 *)this)->_2_cur))) : (((int)now.futex.word)) );
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
		goto S_071_0;
S_071_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 25: /* STATE 68 - ../../../gustedt_mutex2.pml:56 - [((cur==prev))] (0:0:2 - 1) */
		IfNotBlocked
		reached[0][68] = 1;
		if (!((((int)((P0 *)this)->_2_cur)==((int)((P0 *)this)->_2_prev))))
			continue;
		/* dead 1: _2_cur */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->_2_cur;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_2_cur = 0;
		/* dead 1: _2_prev */  (trpt+1)->bup.ovals[1] = ((P0 *)this)->_2_prev;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_2_prev = 0;
		_m = 3; goto P999; /* 0 */
	case 26: /* STATE 71 - ../../../gustedt_mutex2.pml:57 - [cur = prev] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][71] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_cur);
		((P0 *)this)->_2_cur = ((int)((P0 *)this)->_2_prev);
#ifdef VAR_RANGES
		logval("Thread:cur", ((int)((P0 *)this)->_2_cur));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 27: /* STATE 77 - ../../../gustedt_mutex2.pml:61 - [prev = 0] (0:0:1 - 6) */
		IfNotBlocked
		reached[0][77] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_prev);
		((P0 *)this)->_2_prev = 0;
#ifdef VAR_RANGES
		logval("Thread:prev", ((int)((P0 *)this)->_2_prev));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 28: /* STATE 78 - ../../../gustedt_mutex2.pml:61 - [cur = 0] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][78] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_cur);
		((P0 *)this)->_2_cur = 0;
#ifdef VAR_RANGES
		logval("Thread:cur", ((int)((P0 *)this)->_2_cur));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 29: /* STATE 80 - ../../../mutex_generic.pml:26 - [num_threads_in_cs = (num_threads_in_cs+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][80] = 1;
		(trpt+1)->bup.oval = ((int)now.num_threads_in_cs);
		now.num_threads_in_cs = (((int)now.num_threads_in_cs)+1);
#ifdef VAR_RANGES
		logval("num_threads_in_cs", ((int)now.num_threads_in_cs));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 30: /* STATE 81 - ../../../mutex_generic.pml:27 - [num_threads_in_cs = (num_threads_in_cs-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][81] = 1;
		(trpt+1)->bup.oval = ((int)now.num_threads_in_cs);
		now.num_threads_in_cs = (((int)now.num_threads_in_cs)-1);
#ifdef VAR_RANGES
		logval("num_threads_in_cs", ((int)now.num_threads_in_cs));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 31: /* STATE 88 - ../../../gustedt_mutex2.pml:65 - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][88] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_085_0: /* 2 */
S_084_0: /* 2 */
S_081_0: /* 2 */
		((P0 *)this)->_2_prev = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:prev", ((int)((P0 *)this)->_2_prev));
#endif
		;
S_082_0: /* 2 */
		now.futex.word = (((1<<7)-1)&((int)now.futex.word));
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
S_083_0: /* 2 */
		now.futex.word = ( ((((int)now.futex.word)==0)) ? ((2+1)) : ((((int)now.futex.word)-1)) );
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
		goto S_086_0;
S_086_0: /* 2 */
		Printf("T%d unlocks: set futex word from %d to %d\n", ((int)((P0 *)this)->_pid), ((int)((P0 *)this)->_2_prev), ((int)now.futex.word));
		goto S_110_0;
S_110_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 32: /* STATE 89 - ../../../gustedt_mutex2.pml:70 - [((prev!=((1<<7)|1)))] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][89] = 1;
		if (!((((int)((P0 *)this)->_2_prev)!=((1<<7)|1))))
			continue;
		/* dead 1: _2_prev */  (trpt+1)->bup.oval = ((P0 *)this)->_2_prev;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_2_prev = 0;
		_m = 3; goto P999; /* 0 */
	case 33: /* STATE 90 - ../../../futex.pml:70 - [assert(!(futex.wait[_pid]))] (0:103:1 - 1) */
		IfNotBlocked
		reached[0][90] = 1;
		spin_assert( !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 4) ])), " !(futex.wait[_pid])", II, tt, t);
		/* merge: num_woken = 0(103, 91, 103) */
		reached[0][91] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = 0;
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 104, 103) */
		reached[0][104] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 34: /* STATE 92 - ../../../futex.pml:74 - [(((num_woken==1)||(futex.num_waiting==0)))] (117:0:2 - 1) */
		IfNotBlocked
		reached[0][92] = 1;
		if (!(((((int)((P0 *)this)->_2_num_woken)==1)||(((int)now.futex.num_waiting)==0))))
			continue;
		/* merge: goto :b3(117, 93, 117) */
		reached[0][93] = 1;
		;
		/* merge: printf('T%d woke up %d thread(s)\\n',_pid,num_woken)(117, 106, 117) */
		reached[0][106] = 1;
		Printf("T%d woke up %d thread(s)\n", ((int)((P0 *)this)->_pid), ((int)((P0 *)this)->_2_num_woken));
		/* merge: num_woken = 0(117, 107, 117) */
		reached[0][107] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = 0;
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(117, 112, 117) */
		reached[0][112] = 1;
		;
		/* merge: prev = 0(117, 113, 117) */
		reached[0][113] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->_2_prev);
		((P0 *)this)->_2_prev = 0;
#ifdef VAR_RANGES
		logval("Thread:prev", ((int)((P0 *)this)->_2_prev));
#endif
		;
		/* merge: .(goto)(0, 118, 117) */
		reached[0][118] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 35: /* STATE 95 - ../../../futex.pml:78 - [(futex.wait[1])] (103:0:3 - 1) */
		IfNotBlocked
		reached[0][95] = 1;
		if (!(((int)now.futex.wait[1])))
			continue;
		/* merge: futex.wait[1] = 0(103, 96, 103) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[1]);
		now.futex.wait[1] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[1]", ((int)now.futex.wait[1]));
#endif
		;
		/* merge: .(goto)(103, 100, 103) */
		reached[0][100] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(103, 101, 103) */
		reached[0][101] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(103, 102, 103) */
		reached[0][102] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 104, 103) */
		reached[0][104] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 36: /* STATE 97 - ../../../futex.pml:80 - [(futex.wait[2])] (103:0:3 - 1) */
		IfNotBlocked
		reached[0][97] = 1;
		if (!(((int)now.futex.wait[2])))
			continue;
		/* merge: futex.wait[2] = 0(103, 98, 103) */
		reached[0][98] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[2]);
		now.futex.wait[2] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[2]", ((int)now.futex.wait[2]));
#endif
		;
		/* merge: .(goto)(103, 100, 103) */
		reached[0][100] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(103, 101, 103) */
		reached[0][101] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(103, 102, 103) */
		reached[0][102] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 104, 103) */
		reached[0][104] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 37: /* STATE 101 - ../../../futex.pml:82 - [futex.num_waiting = (futex.num_waiting-1)] (0:103:2 - 3) */
		IfNotBlocked
		reached[0][101] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(103, 102, 103) */
		reached[0][102] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 104, 103) */
		reached[0][104] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 38: /* STATE 106 - ../../../futex.pml:85 - [printf('T%d woke up %d thread(s)\\n',_pid,num_woken)] (0:117:2 - 3) */
		IfNotBlocked
		reached[0][106] = 1;
		Printf("T%d woke up %d thread(s)\n", ((int)((P0 *)this)->_pid), ((int)((P0 *)this)->_2_num_woken));
		/* merge: num_woken = 0(117, 107, 117) */
		reached[0][107] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = 0;
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(117, 112, 117) */
		reached[0][112] = 1;
		;
		/* merge: prev = 0(117, 113, 117) */
		reached[0][113] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->_2_prev);
		((P0 *)this)->_2_prev = 0;
#ifdef VAR_RANGES
		logval("Thread:prev", ((int)((P0 *)this)->_2_prev));
#endif
		;
		/* merge: .(goto)(0, 118, 117) */
		reached[0][118] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 39: /* STATE 113 - ../../../gustedt_mutex2.pml:73 - [prev = 0] (0:117:1 - 3) */
		IfNotBlocked
		reached[0][113] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_prev);
		((P0 *)this)->_2_prev = 0;
#ifdef VAR_RANGES
		logval("Thread:prev", ((int)((P0 *)this)->_2_prev));
#endif
		;
		/* merge: .(goto)(0, 118, 117) */
		reached[0][118] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 40: /* STATE 115 - ../../../mutex_generic.pml:29 - [printf('T%d is done\\n',_pid)] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][115] = 1;
		Printf("T%d is done\n", ((int)((P0 *)this)->_pid));
		_m = 3; goto P999; /* 0 */
	case 41: /* STATE 120 - ../../../mutex_generic.pml:31 - [-end-] (0:0:0 - 3) */
		IfNotBlocked
		reached[0][120] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}
