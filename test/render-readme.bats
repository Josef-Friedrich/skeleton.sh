#! /usr/bin/env bats

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
