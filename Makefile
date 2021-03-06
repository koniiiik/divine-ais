LATEX ?= pdflatex
UMLET ?= umlet

COMMON_PREREQUISITES = preamble.tex finish.tex
DOMAIN_PREREQUISITES = chapters/01domain.tex umlet-models/domain_model.pdf
USECASE_PREREQUISUTES = chapters/02usecase.tex umlet-models/usecase.pdf

.PHONY: default all

default: full.pdf

all: full.pdf domain.pdf usecase.pdf

full.pdf: full.tex $(COMMON_PREREQUISITES) $(DOMAIN_PREREQUISITES) $(USECASE_PREREQUISUTES)

domain.pdf: $(COMMON_PREREQUISITES) $(DOMAIN_PREREQUISITES)
usecase.pdf: $(COMMON_PREREQUISITES) $(USECASE_PREREQUISUTES)

%.pdf: %.tex
	$(LATEX) $<
	$(LATEX) $<
	$(LATEX) $<

umlet-models/%.pdf: umlet-models/%.uxf
	$(UMLET) -action=convert -format=pdf -filename=$<
