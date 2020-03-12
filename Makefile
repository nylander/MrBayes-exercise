# Makefile for the mb lab
# Last modified: Thu Mar 12, 2020  06:18PM
# Sign: JN

LYX = lyx

LYXFLAGS = --export pdf4

LYXFILE = mb-lab.lyx

PDF = mb-lab.pdf

DATA = $(wildcard data/*.txt)

IMAGES = images

MBDIR = www/mb

READMEHTML = www/README.html

all: pdf www

pdf: $(PDF)

WWW:
	mkdir -p $(MBDIR)

$(PDF): $(LYXFILE) $(IMAGES)
	$(LYX) $(LYXFLAGS) $(LYXFILE)

$(MBDIR):
	mkdir -p $(MBDIR)

www: $(PDF) $(data) $(READMEHTML) $(MBDIR)
	cp $(PDF) $(MBDIR)
	cp $(DATA) $(MBDIR)
	cp $(READMEHTML) $(MBDIR)

clean:
	rm $(PDF)

cleanwww:
	rm -r $(MBDIR)
