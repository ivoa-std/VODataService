# ivoatex Makefile.  The ivoatex/README for the targets available.

# short name of your document (edit $DOCNAME.tex; would be like RegTAP)
DOCNAME = VODataService

# count up; you probably do not want to bother with versions <1.0
DOCVERSION = 1.2

# Publication date, ISO format; update manually for "releases"
DOCDATE = 2021-02-23

# What is it you're writing: NOTE, WD, PR, REC, PEN, or EN
DOCTYPE = PR

# Source files for the TeX document (but the main file must always
# be called $(DOCNAME).tex
SOURCES = $(DOCNAME).tex role_diagram.pdf ipac-resource.xml

# List of image files to be included in submitted package (anything that
# can be rendered directly by common web browsers)
FIGURES = role_diagram.svg 

# List of PDF figures (figures that must be converted to pixel images to
# work in web browsers).
VECTORFIGURES = resclasses.pdf

# Additional files to distribute (e.g., CSS, schema files, examples...)
AUX_FILES = VODataService-v1.2.xsd

AUTHOR_EMAIL=msdemlei@ari.uni-heidelberg.de

%.pdf: %.tex
	pdflatex $<

%.pdf: %.psfig
	ps2pdf -dEPSCrop $*.psfig $*.pdf

%.psfig: %.texfig
	tex $<
	dvips $*
	ps2epsi $*.ps $*.psfig
	rm $*.ps

include ivoatex/Makefile
