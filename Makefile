# Makefile for compiling modCV.tex with different configurations

# Variables
LATEX=pdflatex
SRC=modCV.tex
OUTDIR=output

# Targets
all: security teaching combined

security:
	mkdir -p $(OUTDIR)
	$(LATEX) "\def\security{true} \def\teaching{false} \input{$(SRC)}"
	mv modCV.pdf $(OUTDIR)/securityCV.pdf

teaching:
	mkdir -p $(OUTDIR)
	$(LATEX) "\def\security{false} \def\teaching{true} \input{$(SRC)}"
	mv modCV.pdf $(OUTDIR)/teachingCV.pdf

combined:
	mkdir -p $(OUTDIR)
	$(LATEX) "\def\security{true} \def\teaching{true} \input{$(SRC)}"
	mv modCV.pdf $(OUTDIR)/combinedCV.pdf

clean:
	rm -f *.aux *.log *.out *.toc
	rm -rf $(OUTDIR)

.PHONY: all security teaching combined clean

