LATEX ?= pdflatex
UMLET ?= umlet

COMMON_PREREQUISITES = preamble.tex finish.tex
DOMAIN_PREREQUISITES = chapters/01domain.tex umlet-models/domain_model.pdf

.PHONY: default all

default: full.pdf

all: full.pdf domain.pdf

full.pdf: full.tex $(COMMON_PREREQUISITES) $(DOMAIN_PREREQUISITES)

%.pdf: %.tex
	$(LATEX) $<
	$(LATEX) $<
	$(LATEX) $<

umlet-models/%.pdf: umlet-models/%.uxf
	$(UMLET) -action=convert -format=pdf -filename=$<
