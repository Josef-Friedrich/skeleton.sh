#!/usr/bin/env bats

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
#
##

@test "./examples/long-options.sh _getopts -x" {
	#_getopts -x || :
	[ -z "$OPT_ALPHA" ]
	[ -z "$OPT_BRAVO" ]
	[ -z "$OPT_CHARLIE" ]
}
