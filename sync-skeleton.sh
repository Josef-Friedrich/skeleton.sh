#! /bin/sh

_get() {
	mkdir -p "$(dirname "$1")"
	wget -O "$1" "https://raw.githubusercontent.com/JosefFriedrich-shell/skeleton/master/$1"
}

## This SEPARATOR is required for test purposes. Please don’t remove! ##

_get .travis.yml
_get Makefile
_get test.sh
_get test/lib/bash_unit
_get test/lib/bats/bats
_get test/lib/bats/bats-exec-suite
_get test/lib/bats/bats-exec-test
_get test/lib/bats/bats-format-tap-stream
_get test/lib/bats/bats-preprocess
_get test/lib/test-helper.sh

chmod a+x test.sh
chmod a+x test/lib/bash_unit
chmod a+x test/lib/bats/bats
chmod a+x test/lib/bats/bats-exec-suite
chmod a+x test/lib/bats/bats-exec-test
chmod a+x test/lib/bats/bats-format-tap-stream
chmod a+x test/lib/bats/bats-preprocess

rm -f test/bash_unit
rm -f test/test-helper.sh
rm -f sync-skeleton.sh
