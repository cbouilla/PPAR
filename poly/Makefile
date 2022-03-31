DEPS_DIR = .deps
LATEXMK = latexmk -recorder -use-make -deps \
                  -e 'warn qq(In Makefile, turn off custom dependencies\n);' \
                  -e '@cus_dep_list = ();' \
                  -e 'show_cus_dep();'

all : poly.pdf

$(foreach file,$(TARGETS),$(eval -include $(DEPS_DIR)/$(file)P))

$(DEPS_DIR) :
	mkdir $@

%.pdf : %.tex
	if [ ! -e $(DEPS_DIR) ]; then mkdir $(DEPS_DIR); fi
	$(LATEXMK) -pdflatex -shell-escape -deps-out=$(DEPS_DIR)/$@P $<

.PHONY: clean

clean:
	rm -rf *.log *.aux *.out *.bbl *.blg _minted-*
	rm -f poly.pdf
