.PHONY: all install-hooks clean

root := $(dir $(lastword $(MAKEFILE_LIST)))

all: wishlist.txt perks.m4

install-hooks:
	for hook in $(root).hooks/*; do \
		ln -sf ../../$${hook} $(root).git/hooks/; \
	done

wishlist.txt: wishlist.m4 perks.m4 weapons.m4 common.m4
	m4 $< > $@

perks.m4 weapons.m4 manifest.json names.json:
	$(MAKE) -f Makefile.gen $@

clean:
	rm *.json || true
