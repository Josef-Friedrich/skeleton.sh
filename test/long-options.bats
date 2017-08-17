#!/usr/bin/env bats

setup() {
	. ./test/lib/test-helper.sh
}

@test "./examples/long-options.sh _getopts -a" {
	source_exec ./examples/long-options.sh
	_getopts -a
	[ "$OPT_ALPHA" -eq 1 ]
	[ -z "$OPT_BRAVO" ]
	[ -z "$OPT_CHARLIE" ]
}

@test "./examples/long-options.sh _getopts -b lol" {
	source_exec ./examples/long-options.sh
	_getopts -b lol
	[ -z "$OPT_ALPHA" ]
	[ "$OPT_BRAVO" = lol ]
	[ -z "$OPT_CHARLIE" ]
}

@test "./examples/long-options.sh _getopts -ac" {
	source_exec ./examples/long-options.sh
	_getopts -ac
	[ "$OPT_ALPHA" -eq 1 ]
	[ -z "$OPT_BRAVO" ]
	[ "$OPT_CHARLIE" -eq 1 ]
}

@test "./examples/long-options.sh _getopts -a -b lol -c" {
	source_exec ./examples/long-options.sh
	_getopts -a -b lol -c
	[ "$OPT_ALPHA" -eq 1 ]
	[ "$OPT_BRAVO" = lol ]
	[ "$OPT_CHARLIE" -eq 1 ]
}

##
# Long options
##

@test "./examples/long-options.sh _getopts --alpha" {
	source_exec ./examples/long-options.sh
	_getopts --alpha
	[ "$OPT_ALPHA" -eq 1 ]
	[ -z "$OPT_BRAVO" ]
	[ -z "$OPT_CHARLIE" ]
}

@test "./examples/long-options.sh _getopts --bravo=lol" {
	source_exec ./examples/long-options.sh
	_getopts --bravo=lol
	[ -z "$OPT_ALPHA" ]
	[ "$OPT_BRAVO" = lol ]
	[ -z "$OPT_CHARLIE" ]
}

@test "./examples/long-options.sh _getopts --alpha --charlie" {
	source_exec ./examples/long-options.sh
	_getopts --alpha --charlie
	[ "$OPT_ALPHA" -eq 1 ]
	[ -z "$OPT_BRAVO" ]
	[ "$OPT_CHARLIE" -eq 1 ]
}

@test "./examples/long-options.sh _getopts --alpha --bravo=lol --charlie" {
	source_exec ./examples/long-options.sh
	_getopts --alpha --bravo=lol --charlie
	[ "$OPT_ALPHA" -eq 1 ]
	[ "$OPT_BRAVO" = lol ]
	[ "$OPT_CHARLIE" -eq 1 ]
}
