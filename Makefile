.PHONY: all install-hooks

root := $(dir $(lastword $(MAKEFILE_LIST)))

all: wishlist.txt

install-hooks:
	for hook in $(root).hooks/*; do \
		ln -sf ../../$${hook} $(root).git/hooks/; \
	done

wishlist.txt: wishlist.m4
	m4 $< > $@
