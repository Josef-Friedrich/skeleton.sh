#! /bin/sh

_get() {
	mkdir -p "$(dirname "$1")"
	wget -O "$1" "https://raw.githubusercontent.com/JosefFriedrich-shell/skeleton/master/$1"
}

_getx() {
	_get "$1"
	chmod a+x "$1"
}

_getif() {
	if [ ! -f "$1" ]; then
		_get "$1"
	fi
}

_rm() {
	rm -rf "$1"
}

## This SEPARATOR is required for test purposes. Please don’t remove! ##

_get .travis.yml
_get Makefile
_get test/lib/test-helper.sh
_getif README.md.template.sh
_getx test.sh
_getx test/lib/bash_unit
_getx test/lib/bats/bats
_getx test/lib/bats/bats-exec-suite
_getx test/lib/bats/bats-exec-test
_getx test/lib/bats/bats-format-tap-stream
_getx test/lib/bats/bats-preprocess
_getx test/lib/render-readme.sh
_getx test/lib/test-runner.sh

_rm sync-skeleton.sh
_rm test.sh
_rm test/bash_unit
_rm test/test-helper.sh
