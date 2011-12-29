all: machines.pdf
	evince $<

machines.pdf: machines.tex
	pdflatex $<
	bibtex $(basename $<)
	pdflatex $<
	pdflatex $<

clean:
	rm -f machines.pdf machines.aux machines.toc machines.log
