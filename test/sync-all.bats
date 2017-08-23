#! /usr/bin/env bats

setup() {
	. ./test/lib/test-helper.sh
	source_exec ./skeleton.sh
}

@test "_getopts -A" {
	_getopts -A
	[ "$OPT_ALL" -eq 1 ]
}

@test "_getopts --sync-all" {
	_getopts --sync-all
	[ "$OPT_ALL" -eq 1 ]
}
