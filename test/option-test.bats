#! /usr/bin/env bats

setup() {
	. ./test/lib/test-helper.sh
	source_exec ./skeleton.sh
}

@test "_getopts -t" {
	_getopts -t
	[ "$OPT_TEST" -eq 1 ]
}

@test "_getopts --test" {
	_getopts --test
	[ "$OPT_TEST" -eq 1 ]
}
