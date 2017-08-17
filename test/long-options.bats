#! /usr/bin/env bats

setup() {
	. ./test/lib/test-helper.sh
	source_exec ./examples/long-options.sh
}

@test "./examples/long-options.sh _getopts -a" {
	_getopts -a
	[ "$OPT_ALPHA" -eq 1 ]
	[ -z "$OPT_BRAVO" ]
	[ -z "$OPT_CHARLIE" ]
}

@test "./examples/long-options.sh _getopts -b lol" {
	_getopts -b lol
	[ -z "$OPT_ALPHA" ]
	[ "$OPT_BRAVO" = lol ]
	[ -z "$OPT_CHARLIE" ]
}

@test "./examples/long-options.sh _getopts -ac" {
	_getopts -ac
	[ "$OPT_ALPHA" -eq 1 ]
	[ -z "$OPT_BRAVO" ]
	[ "$OPT_CHARLIE" -eq 1 ]
}

@test "./examples/long-options.sh _getopts -a -b lol -c" {
	_getopts -a -b lol -c
	[ "$OPT_ALPHA" -eq 1 ]
	[ "$OPT_BRAVO" = lol ]
	[ "$OPT_CHARLIE" -eq 1 ]
}

##
# Long options
##

@test "./examples/long-options.sh _getopts --alpha" {
	_getopts --alpha
	[ "$OPT_ALPHA" -eq 1 ]
	[ -z "$OPT_BRAVO" ]
	[ -z "$OPT_CHARLIE" ]
}

@test "./examples/long-options.sh _getopts --bravo=lol" {
	_getopts --bravo=lol
	[ -z "$OPT_ALPHA" ]
	[ "$OPT_BRAVO" = lol ]
	[ -z "$OPT_CHARLIE" ]
}

@test "./examples/long-options.sh _getopts --alpha --charlie" {
	_getopts --alpha --charlie
	[ "$OPT_ALPHA" -eq 1 ]
	[ -z "$OPT_BRAVO" ]
	[ "$OPT_CHARLIE" -eq 1 ]
}

@test "./examples/long-options.sh _getopts --alpha --bravo=lol --charlie" {
	_getopts --alpha --bravo=lol --charlie
	[ "$OPT_ALPHA" -eq 1 ]
	[ "$OPT_BRAVO" = lol ]
	[ "$OPT_CHARLIE" -eq 1 ]
}

##
# Errors
##

@test "long-options.sh -x" {
	run ./examples/long-options.sh -x
	[ "$status" -eq 2 ]
	[ "${lines[0]}" = 'Invalid option “-x”!' ]
}

@test "long-options.sh -b" {
	run ./examples/long-options.sh -b
	[ "$status" -eq 3 ]
	[ "${lines[0]}" = "Option “-b” requires an argument!" ]
}

@test "long-options.sh --bravo" {
	run ./examples/long-options.sh --bravo
	[ "$status" -eq 3 ]
	[ "${lines[0]}" = "Option “--bravo” requires an argument!" ]
}

@test "long-options.sh --alpha=lol" {
	run ./examples/long-options.sh --alpha=lol
	[ "$status" -eq 4 ]
	[ "${lines[0]}" = "No argument allowed for the option “--alpha=lol”!" ]
}

@test "long-options.sh --charlie=lol" {
	run ./examples/long-options.sh --charlie=lol
	[ "$status" -eq 4 ]
	[ "${lines[0]}" = "No argument allowed for the option “--charlie=lol”!" ]
}

@test "long-options.sh --xxx" {
	run ./examples/long-options.sh --xxx
	[ "$status" -eq 2 ]
	[ "${lines[0]}" = "Invalid option “--xxx”!" ]
}

##
# With positional parameters
##

@test "long-options.sh one two" {
	run ./examples/long-options.sh one two
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Parameter 1: one" ]
	[ "${lines[1]}" = "Parameter 2: two" ]
}

@test "long-options.sh -a one two" {
	run ./examples/long-options.sh -a one two
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Parameter 1: one" ]
	[ "${lines[1]}" = "Parameter 2: two" ]
}

@test "long-options.sh -a --bravo=lol --charlie one two" {
	run ./examples/long-options.sh -a --bravo=lol --charlie one two
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Parameter 1: one" ]
	[ "${lines[1]}" = "Parameter 2: two" ]
}

@test "long-options.sh -x one two" {
	run ./examples/long-options.sh -x one two
	[ "$status" -eq 2 ]
	[ "${lines[0]}" = 'Invalid option “-x”!' ]
}


@test "long-options.sh --alpha --charlie -- one two" {
	run ./examples/long-options.sh --alpha --charlie -- one two
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Parameter 1: one" ]
	[ "${lines[1]}" = "Parameter 2: two" ]
}

@test "long-options.sh -- one two" {
	run ./examples/long-options.sh -- one two
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Parameter 1: one" ]
	[ "${lines[1]}" = "Parameter 2: two" ]
}

@test "long-options.sh - one two" {
	run ./examples/long-options.sh - one two
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Parameter 1: -" ]
	[ "${lines[1]}" = "Parameter 2: one" ]
}
