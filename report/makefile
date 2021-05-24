IMAGE := dragonflyscience/dragonverse-18.04:2020-06-08

all: report.pdf

report.pdf: report.tex
	xelatex $<; biber $(basename $<); xelatex $<; xelatex $<;


.PHONY: clean

clean:
	rm -f  *.pdf *.aux *.log *.out *.backup *.glo *.idx \
		 *.fdb_latexmk *.fls *-self.bib *.toc *.snm *.nav \
		 *.ilg *-blx.bib *.run.xml *.bbl *.ind *.blg *.bcf

interact:
	docker run -it --rm -w /work -v $$(pwd):/work \
		--net=host \
		-e DISPLAY=$DISPLAY \
		-v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 \
		-u $$(id -u):$$(id -g) $(IMAGE) bash

