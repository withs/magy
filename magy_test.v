module magy

fn test_classic() {
	assert a_cat('hi mom') == '[-] hi mom'
	assert a_lncat('hi mom') == '\n[-] hi mom'
	assert a_cont('hi mom') == '[+] hi mom'
	assert a_misc('hi mom') == '[*] hi mom'
}
