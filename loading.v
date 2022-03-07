module magy

import time

// interval: time in seconds between each char print.
// max_chars: max allowed char on a line (set it to -1 to uncap).
// delete_line_at_end (opt): decide if the rest of the animation is deleted at end.
// indicator: char wich will be printed.
// finish_msg (opt): message wich will be printed at the end (if no message specified the line is removed).
// force_stop_msg (opt): message wich will be printed when you call .stop() (if no message specified then it use finish_msg).
pub struct Loading {
	interval           int
	max_chars          int
	max_time           int
	delete_line_at_end bool = true
	indicator          string
	finish_msg         string
	force_stop_msg     string
mut:
	cnt        int
	total_time int
	force_stop bool
	h_thread   thread
}

fn (mut l Loading) t_start() {
	for l.total_time < l.max_time {
		if l.force_stop {
			break
		}

		if l.max_chars != -1 && l.cnt >= l.max_chars {
			clean_line()
			l.cnt = 0
		}

		prnt(l.indicator, false)

		time.sleep(l.interval * time.second)
		l.cnt++
		l.total_time++
	}
	if l.delete_line_at_end {
		clean_line()
	} else {
		if l.force_stop {
			if l.force_stop_msg != '' {
				clean_line()
				prnt(l.force_stop_msg, true)
			} else if l.finish_msg != '' {
				clean_line()
				prnt(l.finish_msg, true)
			}
		} else {
			if l.finish_msg != '' {
				clean_line()
				prnt(l.finish_msg, true)
			}
		}
	}
}

// start the loading animation.
// block: spawn a thread to draw the loading animation.
pub fn (mut l Loading) start(block bool) {
	if block {
		l.t_start()
	} else {
		l.h_thread = go l.t_start()
	}
}

// Stop le loading animation.
// note: only stop a loading if started with block false.
pub fn (mut l Loading) stop() {
	l.force_stop = true
	l.h_thread.wait()
}
