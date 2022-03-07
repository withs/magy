module magy

// change here if you want to use other print function such as puts
[inline]
fn prnt(content string, lb bool) {
	if lb {
		println(content)
	} else {
		print(content)
	}
}

[inline]
fn clean_line() {
	prnt('\x1b[1F', true)
	prnt('\x1b[2K', false)
}
