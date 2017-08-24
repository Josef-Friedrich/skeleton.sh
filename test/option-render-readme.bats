#! /usr/bin/env bats

setup() {
	. ./test/lib/test-helper.sh
	source_exec ./skeleton.sh
}

@test "_getopts -r" {
	_getopts -r
	[ "$OPT_README" -eq 1 ]
}

@test "_getopts --render-readme" {
	_getopts --render-readme
	[ "$OPT_README" -eq 1 ]
}

@test "./skeleton.sh -r" {
	rm -f README.md
	run ./skeleton.sh -r
	[ -f README.md ]
	grep 'make test' README.md
}

@test "./skeleton.sh --render-readme" {
	rm -f README.md
	run ./skeleton.sh --render-readme
	[ -f README.md ]
	grep 'make test' README.md
}

@test "make readme" {
	rm -f README.md
	run make readme
	[ "$status" -eq 0 ]
	[ -f README.md ]
	grep 'make test' README.md
}

@test "./skeleton.sh --render-readme=lol" {
	run ./skeleton.sh --render-readme=lol
	[ "$status" -eq 4 ]
	[ "${lines[0]}" = "No argument allowed for the option “--render-readme=lol”!" ]
}
