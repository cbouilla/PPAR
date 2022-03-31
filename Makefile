all:
	$(MAKE) -C poly
	$(MAKE) -C slides

.PHONY: clean

clean:
	cd poly && $(MAKE) clean
	cd slides && $(MAKE) clean

