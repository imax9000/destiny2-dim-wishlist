.PHONY: all install-hooks clean

root := $(dir $(lastword $(MAKEFILE_LIST)))

datafiles := data/perks.m4 data/weapons.m4

all: wishlist.txt

install-hooks:
	for hook in $(root).hooks/*; do \
		ln -sf ../../$${hook} $(root).git/hooks/; \
	done

wishlist.txt: wishlist.m4 common.m4 $(datafiles)
	m4 common.m4 $< > $@

$(datafiles) manifest.json names.json:
	$(MAKE) -f Makefile.gen $@

clean:
	rm *.json || true
