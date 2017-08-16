#!/usr/bin/env bats

setup() {
	. ./test/lib/test-helper.sh
	mock_path $(pwd)/test/bin
}

@test "run" {
	run echo "lol"
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = 'lol' ]
}

@test "addition using bc" {
	result="$(echo 2+2 | bc)"
	[ "$result" -eq 4 ]
}

@test "multiplication using bc" {
	result="$(echo 2*2 | bc)"
	[ "$result" -eq 4 ]
}

@test "skip" {
	skip
	result="$(echo 2*2 | bc)"
	[ "$result" -eq 3 ]
}

@test "mock_path" {
	run command1
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = 'This is command1!' ]
}
