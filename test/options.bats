#! /usr/bin/env bats

setup() {
	. ./test/lib/test-helper.sh
	source_exec ./skeleton.sh
}

@test "./skeleton.sh _getopts -a" {
	_getopts -a
	[ "$OPT_ALPHA" -eq 1 ]
	[ -z "$OPT_BRAVO" ]
	[ -z "$OPT_CHARLIE" ]
}

@test "./skeleton.sh _getopts -b lol" {
	_getopts -b lol
	[ -z "$OPT_ALPHA" ]
	[ "$OPT_BRAVO" = lol ]
	[ -z "$OPT_CHARLIE" ]
}

@test "./skeleton.sh _getopts -ac" {
	_getopts -ac
	[ "$OPT_ALPHA" -eq 1 ]
	[ -z "$OPT_BRAVO" ]
	[ "$OPT_CHARLIE" -eq 1 ]
}

@test "./skeleton.sh _getopts -a -b lol -c" {
	_getopts -a -b lol -c
	[ "$OPT_ALPHA" -eq 1 ]
	[ "$OPT_BRAVO" = lol ]
	[ "$OPT_CHARLIE" -eq 1 ]
}

##
# Long options
##

@test "./skeleton.sh _getopts --alpha" {
	_getopts --alpha
	[ "$OPT_ALPHA" -eq 1 ]
	[ -z "$OPT_BRAVO" ]
	[ -z "$OPT_CHARLIE" ]
}

@test "./skeleton.sh _getopts --bravo=lol" {
	_getopts --bravo=lol
	[ -z "$OPT_ALPHA" ]
	[ "$OPT_BRAVO" = lol ]
	[ -z "$OPT_CHARLIE" ]
}

@test "./skeleton.sh _getopts --alpha --charlie" {
	_getopts --alpha --charlie
	[ "$OPT_ALPHA" -eq 1 ]
	[ -z "$OPT_BRAVO" ]
	[ "$OPT_CHARLIE" -eq 1 ]
}

@test "./skeleton.sh _getopts --alpha --bravo=lol --charlie" {
	_getopts --alpha --bravo=lol --charlie
	[ "$OPT_ALPHA" -eq 1 ]
	[ "$OPT_BRAVO" = lol ]
	[ "$OPT_CHARLIE" -eq 1 ]
}

##
# Errors
##

@test "skeleton.sh -x" {
	run ./skeleton.sh -x
	[ "$status" -eq 2 ]
	[ "${lines[0]}" = 'Invalid option “-x”!' ]
}

@test "skeleton.sh -b" {
	run ./skeleton.sh -b
	[ "$status" -eq 3 ]
	[ "${lines[0]}" = "Option “-b” requires an argument!" ]
}

@test "skeleton.sh --bravo" {
	run ./skeleton.sh --bravo
	[ "$status" -eq 3 ]
	[ "${lines[0]}" = "Option “--bravo” requires an argument!" ]
}

@test "skeleton.sh --alpha=lol" {
	run ./skeleton.sh --alpha=lol
	[ "$status" -eq 4 ]
	[ "${lines[0]}" = "No argument allowed for the option “--alpha=lol”!" ]
}

@test "skeleton.sh --charlie=lol" {
	run ./skeleton.sh --charlie=lol
	[ "$status" -eq 4 ]
	[ "${lines[0]}" = "No argument allowed for the option “--charlie=lol”!" ]
}

@test "skeleton.sh --xxx" {
	run ./skeleton.sh --xxx
	[ "$status" -eq 2 ]
	[ "${lines[0]}" = "Invalid option “--xxx”!" ]
}

##
# With positional parameters
##

@test "skeleton.sh one two" {
	run ./skeleton.sh one two
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Parameter 1: one" ]
	[ "${lines[1]}" = "Parameter 2: two" ]
}

@test "skeleton.sh -a one two" {
	run ./skeleton.sh -a one two
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Parameter 1: one" ]
	[ "${lines[1]}" = "Parameter 2: two" ]
}

@test "skeleton.sh -a --bravo=lol --charlie one two" {
	run ./skeleton.sh -a --bravo=lol --charlie one two
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Parameter 1: one" ]
	[ "${lines[1]}" = "Parameter 2: two" ]
}

@test "skeleton.sh -x one two" {
	run ./skeleton.sh -x one two
	[ "$status" -eq 2 ]
	[ "${lines[0]}" = 'Invalid option “-x”!' ]
}


@test "skeleton.sh --alpha --charlie -- one two" {
	run ./skeleton.sh --alpha --charlie -- one two
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Parameter 1: one" ]
	[ "${lines[1]}" = "Parameter 2: two" ]
}

@test "skeleton.sh -- one two" {
	run ./skeleton.sh -- one two
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Parameter 1: one" ]
	[ "${lines[1]}" = "Parameter 2: two" ]
}

@test "skeleton.sh - one two" {
	run ./skeleton.sh - one two
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Parameter 1: -" ]
	[ "${lines[1]}" = "Parameter 2: one" ]
}
