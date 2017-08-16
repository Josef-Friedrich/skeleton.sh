#! /bin/sh

_get() {
	mkdir -p "(dirname "$1")"
	wget -O "$1" "https://raw.githubusercontent.com/$2"
}

_get test/lib/bash_unit pgrange/bash_unit/master/bash_unit
_get test/lib/test-helper.sh JosefFriedrich-shell/test-helper/master/test-helper.sh

rm -rf tmp_bats
rm -rf test/lib/bats
git clone https://github.com/sstephenson/bats.git tmp_bats
mv tmp_bats/libexec test/lib/bats
rm -rf tmp_bats
