#! /bin/sh

# bash_unit
echo "
Running bash_unit tests:"
./test/lib/bash_unit test/*.bash_unit
RETURN_BASH_UNIT=$?

# bats
echo "
Running bats tests:"
./test/lib/bats/bats test
## or:
# bats test
RETURN_BATS=$?

if [ 0 -eq "$RETURN_BASH_UNIT" ] && [ 0 -eq "$RETURN_BATS" ] ; then
	echo 'All tests pass!'
	exit 0
else
	echo 'Some tests fail!'
	exit 1
fi