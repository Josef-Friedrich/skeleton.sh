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

@test "./skeleton.sh --sync-skeleton" {
	run ./skeleton.sh --sync-skeleton
	[ "$status" -eq 0 ]
}

@test "make sync_skeleton" {
	run make sync_skeleton
	[ "$status" -eq 0 ]
}

@test "./skeleton.sh --sync-skeleton=lol" {
	run ./skeleton.sh --sync-skeleton=lol
	[ "$status" -eq 4 ]
	[ "${lines[0]}" = "No argument allowed for the option “--sync-skeleton=lol”!" ]
}
