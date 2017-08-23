#!/usr/bin/env bats

setup() {
	. ./test/lib/test-helper.sh
	source_exec ./skeleton.sh
}

@test "run ./skeleton.sh" {
	run ./skeleton.sh
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = '      .-.' ]
}

@test "run ./skeleton.sh -h" {
	run ./skeleton.sh -h
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "skeleton.sh v$VERSION" ]
}

@test "run ./skeleton.sh --help" {
	run ./skeleton.sh --help
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "skeleton.sh v$VERSION" ]
}

@test "run ./skeleton.sh -s" {
	run ./skeleton.sh -s
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = 'This is the management script of the skeleton.sh project!' ]
}

@test "run ./skeleton.sh --short-description" {
	run ./skeleton.sh --short-description
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = 'This is the management script of the skeleton.sh project!' ]
}
