test:
	./test/bash_unit test/*.bash_unit

sync_dependencies:
	wget -O test/bash_unit https://raw.githubusercontent.com/pgrange/bash_unit/master/bash_unit ; \
	chmod a+x test/bash_unit ; \
	wget -O test/test-helper.sh https://raw.githubusercontent.com/JosefFriedrich-shell/test-helper/master/test-helper.sh

.PHONY: test sync_dependencies
