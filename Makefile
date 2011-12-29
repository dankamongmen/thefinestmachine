BOOK:=machines

all: $(BOOK).pdf
	evince $<

$(BOOK).pdf: $(BOOK).tex
	pdflatex $<
	bibtex $(basename $<)
	pdflatex $<
	pdflatex $<

clean:
	rm -f $(BOOK).pdf $(BOOK).aux $(BOOK).toc $(BOOK).log $(BOOK).bbl $(BOOK).blg
