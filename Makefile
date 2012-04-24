.DELETE_ON_ERROR:
.PHONY: all lint clean

BOOK:=machines

all: $(BOOK).pdf
	evince $<

$(BOOK).pdf: $(BOOK).tex
	pdflatex $<

lint: $(BOOK).tex
	chktex $<

#$(BOOK).pdf: $(BOOK).dvi
#	dvipdf $<

$(BOOK).dvi: $(BOOK).tex
	latex $<
	bibtex $(basename $<)
	latex $<
	latex $<

clean:
	rm -f $(BOOK).pdf $(BOOK).aux $(BOOK).toc $(BOOK).log $(BOOK).bbl $(BOOK).blg \
		$(BOOK).idx $(BOOK).dvi $(BOOK).bib
