#!/usr/bin/env bats

@test "run ./skeleton -h" {
	run ./skeleton -h
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = 'Usage: This is a example script' ]
}

@test "run ./skeleton --help" {
	run ./skeleton --help
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = 'Usage: This is a example script' ]
}

@test "run ./skeleton -s" {
	run ./skeleton -s
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = 'A short description of what this command does.' ]
}

@test "run ./skeleton --short-description" {
	run ./skeleton --short-description
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = 'A short description of what this command does.' ]
}
