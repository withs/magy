module main

import magy
import time

fn main() {
	magy.cat('starting a cool task')
	magy.cont('found carrots')
	magy.cont('found brocoli')
	magy.cont('found potatos')
	magy.misc('Done !')

	magy.lncat('starting a steped task')
	mut s_task := magy.Steps{
		max: 4
	}
	s_task.step('finding space')
	magy.misc('found some diamonds in memory ^^')
	s_task.step('allocating space')
	s_task.step('mapping dll')
	s_task.step('executing exported DllMain')
	magy.misc('Done !')

	magy.lncat('starting a loading task')
	magy.cont('loading libs')
	mut ld := magy.Loading{
		interval: 1 // every 1 seconds
		indicator: '.' // a dot will be printed
		max_time: 3 // the max loading time is 3 sec
		max_chars: -1 // max char allowed in a line (here -1 say there is no limit)
		delete_line_at_end: false // we dont want the dot to be deleted at the end
		finish_msg: magy.a_cont('libs loaded') // this will replace le dots when the animation is done (can use any string or use formating funcs like this see docs)
	}
	ld.start(true) // true mean this call is blocking the flaw

	magy.cont('cleaning up project')
	ld = magy.Loading{
		interval: 1
		indicator: '*'
		max_time: 5
		max_chars: 2
		delete_line_at_end: false
		force_stop_msg: magy.a_cont('something is big and cannot be cleaned up') // message if we call .stop() (if you dont specify this attribute then finish_msg is selected)
	}
	ld.start(false) // here we let the flaw continue and we wating to abort or just stop the task before the planned end
	time.sleep(2 * time.second)
	ld.stop()

	magy.cont('cleaning up this big thing')
	ld = magy.Loading{
		interval: 1
		indicator: '-'
		max_time: 10
		max_chars: 2
		delete_line_at_end: false
		finish_msg: magy.a_cont('project is now clean')
	}
	ld.start(false)
	time.sleep(5 * time.second)
	ld.stop()
	// as you can see here every 2 chars on the line, the line is cleaned

	magy.cont('doing something secret you have 3 sec to see it')
	ld = magy.Loading{
		interval: 1
		indicator: '^'
		max_time: 3
		max_chars: -1
		delete_line_at_end: true
		finish_msg: magy.a_cont('project is now clean') // in this case even if you specified a finish_msg or force_stop_msg the line will be deleted
	}
	ld.start(true)
	magy.misc('everthing is ok moving to the next part :)')

	// Counter is pretty similar to loading and steps but have some extra
	magy.lncat('donwloading nasa plans')
	mut c_counter := magy.Counter{
		max: 100
		incr_by: 10
		postfix: '%'
		delete_line_at_end: false
		finish_msg: magy.a_cont('yesss ! got them')
	}
	for _ in 0 .. 11 {
		c_counter.step()
		time.sleep(1 * time.second)
	}

	magy.a_cont('sorting plans')
	c_counter = magy.Counter{
		max: 670667
		incr_by: 1
		prefix: '-> '
		separator: '/'
		delete_line_at_end: false
		finish_msg: magy.a_cont('all file are now sorted')
	}

	for i in 0 .. 670668 {
		if i == 670 {
			c_counter.step_with_msg('found a cool plans')
			time.sleep(2 * time.second)
		} else if i == 67000 {
			c_counter.step_with_msg('and another one')
			time.sleep(2 * time.second)
		} else {
			c_counter.step()
		}
	}
	magy.misc('nice :)')

	magy.lncat('Thank')
	magy.cont('you')
	magy.misc('for seeing this repo :)')
}
