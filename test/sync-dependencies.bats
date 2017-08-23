#! /usr/bin/env bats

setup() {
	. ./test/lib/test-helper.sh
	source_exec ./skeleton.sh
}

@test "_getopts -d" {
	_getopts -d
	[ "$OPT_DEPENDENCIES" -eq 1 ]
}

@test "_getopts --sync-dependencies" {
	_getopts --sync-dependencies
	[ "$OPT_DEPENDENCIES" -eq 1 ]
}

@test "./skeleton.sh -d" {
	skip
	run ./skeleton.sh -d
	[ "$status" -eq 0 ]
	[ -d test/lib/bats ]
	[ -f test/lib/test-helper.sh ]
}

@test "./skeleton.sh --sync-dependencies" {
	run ./skeleton.sh --sync-dependencies
	[ "$status" -eq 0 ]
	[ -d test/lib/bats ]
	[ -f test/lib/test-helper.sh ]
}

@test "./skeleton.sh --sync-dependencies=lol" {
	run ./skeleton.sh --sync-dependencies=lol
	[ "$status" -eq 4 ]
	[ "${lines[0]}" = "No argument allowed for the option “--sync-dependencies=lol”!" ]
}
