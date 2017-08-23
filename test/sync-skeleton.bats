#! /usr/bin/env bats

setup() {
	. ./test/lib/test-helper.sh
	source_exec ./skeleton.sh
}

@test "_getopts -S" {
	_getopts -S
	[ "$OPT_SKELETON" -eq 1 ]
}

@test "_getopts --sync-skeleton" {
	_getopts --sync-skeleton
	[ "$OPT_SKELETON" -eq 1 ]
}

# @test "./skeleton.sh --sync-dependencies" {
# 	run ./skeleton.sh --sync-dependencies
# 	[ "$status" -eq 0 ]
# 	[ -d test/lib/bats ]
# 	[ -f test/lib/test-helper.sh ]
# }

@test "./skeleton.sh --sync-skeleton=lol" {
	run ./skeleton.sh --sync-skeleton=lol
	[ "$status" -eq 4 ]
	[ "${lines[0]}" = "No argument allowed for the option “--sync-skeleton=lol”!" ]
}
