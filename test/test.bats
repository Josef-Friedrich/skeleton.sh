#!/usr/bin/env bats

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
