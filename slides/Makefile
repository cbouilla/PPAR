TARGETS =  01_intro.pdf 02_mpi.pdf 03_comm_cost.pdf 04_algo.pdf 05_OpenMP.pdf \
           06_omp_suite.pdf 07_vectorization.pdf 08_memory.pdf 09_roofline.pdf 0a_profiling.pdf

DEPS_DIR = .deps
LATEXMK = latexmk -recorder -use-make -deps \
                  -e 'warn qq(In Makefile, turn off custom dependencies\n);' \
                  -e '@cus_dep_list = ();' \
                  -e 'show_cus_dep();'

all : $(TARGETS)

$(foreach file,$(TARGETS),$(eval -include $(DEPS_DIR)/$(file)P))

$(DEPS_DIR) :
	mkdir $@


%.pdf : %.tex
	if [ ! -e $(DEPS_DIR) ]; then mkdir $(DEPS_DIR); fi
	$(LATEXMK) -xelatex -shell-escape -deps-out=$(DEPS_DIR)/$@P $<

.PHONY: clean

clean:
	rm -rf *.log *.aux *.out *.bbl *.blg _minted-* *.xdv *.fls *.fdb_latexmk
#	rm -rf $(DEPS_DIR)
	rm -f $(TARGETS)
