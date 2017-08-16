wget_github = wget -O $(1) https://raw.githubusercontent.com/$(2) ; \
	chmod a+x $(1)

test:
	@echo "PATH: $(PATH)"
	@echo
	@echo "PWD: $(shell pwd)"
	@echo

	./test.sh

sync_dependencies:
	$(call wget_github,test/lib/bash_unit,pgrange/bash_unit/master/bash_unit)
	$(call wget_github,test/lib/test-helper.sh,JosefFriedrich-shell/test-helper/master/test-helper.sh)
	rm -rf tmp_bats
	rm -rf test/lib/bats
	git clone https://github.com/sstephenson/bats.git tmp_bats
	mv tmp_bats/libexec test/lib/bats
	rm -rf tmp_bats

.PHONY: test sync_dependencies
