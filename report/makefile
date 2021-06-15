IMAGE := dragonflyscience/dragonverse-18.04:2020-08-12

KNIT_COMMAND = library(knitr);opts_chunk\$$set(warning=F, message = FALSE,echo=F,results='asis',error=FALSE,fig.lp='fig:',fig.path='images/');
KNITR := $(addprefix build/, $(addsuffix .tex, $(basename $(notdir $(shell find . -name '*.rnw')))))
TEX := executive.tex

fast: report.tex $(KNITR) $(TEX)
	xelatex $<;

all: report.pdf

report.pdf: report.tex $(KNITR) $(TEX)
	xelatex $<; biber $(basename $<); xelatex $<; xelatex $<;


build/%.tex: %.rnw
	mkdir -p build/images
	Rscript --vanilla -e "$(KNIT_COMMAND) knit('$(<F)',output='build/$(@F)')"


syncs3:
	mkdir -p s3/
	aws s3 sync s3://vibrant-planet/ s3/

.PHONY: clean
clean:
	rm -f  *.pdf *.aux *.log *.out *.backup *.glo *.idx \
		 *.fdb_latexmk *.fls *-self.bib *.toc *.snm *.nav \
		 *.ilg *-blx.bib *.run.xml *.bbl *.ind *.blg *.bcf \
		 build/*

interact:
	docker run -it --rm -w /work/report -v $$(pwd)/..:/work \
		--net=host \
		-e DISPLAY=$DISPLAY \
		-v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 \
		-u $$(id -u):$$(id -g) $(IMAGE) bash

