module magy

pub struct Steps {
	max int
mut:
	step int = 1
}

pub fn (mut s Steps) step(content string) {
	prnt('[$s.step/$s.max] $content', true)
	s.step++
}

// separator (opt): add a separator between the counter and the max (if a separator is present then the max show, you must add your own space if you need them).
// prefix (opt): add a prefix before the counter.
// postfix (opt): add a postfix after the counter or the max if present.
// delete_line_at_end (opt): decide if the rest of the animation is deleted at end.
// finish_msg (opt): message wich will be printed at the end (if no message specified the line is removed).
pub struct Counter {
	separator          string
	prefix             string
	postfix            string
	delete_line_at_end bool = true
	finish_msg         string

	max     int
	incr_by int = 1
mut:
	cnt int
}

[inline]
fn (s Counter) build_counter() {
	if s.cnt != 0 {
		clean_line()
	}

	if s.prefix != '' {
		prnt('$s.prefix', false)
	}

	if s.separator != '' {
		prnt('$s.cnt', false)
		prnt('$s.separator', false)
		prnt('$s.max', false)
	} else {
		prnt('$s.cnt', false)
	}

	if s.postfix != '' {
		prnt('$s.postfix', false)
	}
}

[inline]
pub fn (mut s Counter) end() {
	if s.cnt == s.max {
		if s.delete_line_at_end {
			clean_line()
		} else {
			if s.finish_msg != '' {
				clean_line()
				prnt(s.finish_msg, true)
			} else {
				prnt('', true)
			}
		}
	}
	s.cnt += s.incr_by
}

pub fn (mut s Counter) step_with_msg(content string) {
	s.build_counter()

	prnt(' $content', false)

	s.end()
}

pub fn (mut s Counter) step() {
	s.build_counter()

	s.end()
}
