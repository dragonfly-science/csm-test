IMAGE := dragonflyscience/dragonverse-18.04:2020-06-08

KNIT_COMMAND = library(knitr);opts_chunk\$$set(warning=F, message = FALSE,echo=F,results='asis',error=FALSE,fig.lp='fig:',fig.path='images/');

all: report.pdf

report.pdf: report.tex \
		build/introduction.tex \
		build/methods.tex
	xelatex $<; biber $(basename $<); xelatex $<; xelatex $<;




build/%.tex: %.rnw
	mkdir -p build/images
	Rscript --vanilla -e "$(KNIT_COMMAND) knit('$(<F)',output='build/$(@F)')"

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

