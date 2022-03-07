module magy

// return a category formated string
[inline]
pub fn a_cat(content string) string {
	return '[-] $content'
}

// return a category formated string with line break at the begining
[inline]
pub fn a_lncat(content string) string {
	return '\n[-] $content'
}

// return a content formated string
[inline]
pub fn a_cont(content string) string {
	return '[+] $content'
}

// return a misc formated string
[inline]
pub fn a_misc(content string) string {
	return '[*] $content'
}

// print a category formated string
[inline]
pub fn cat(content string) {
	prnt(a_cat(content), true)
}

// print a category formated string with line break at the begining
[inline]
pub fn lncat(content string) {
	prnt(a_lncat(content), true)
}

// print a content formated string
[inline]
pub fn cont(content string) {
	prnt(a_cont(content), true)
}

// print a misc formated string
[inline]
pub fn misc(content string) {
	prnt(a_misc(content), true)
}
