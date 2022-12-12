journal.pdf: journal.tex journal.bib
journal.pdf: tufte-common.def
journal.pdf: january.tex

journal.pdf:
	pdflatex journal.tex
	[ -f journal1-blx.aux ] && for b in journal*-blx.aux; do bibtexu $$b; done
	bibtexu journal.aux
	pdflatex journal.tex
	latexmk -pdf journal

tufte-common.def:
	wget -O $@ https://tufte-latex.googlecode.com/git-history/5693d340942265d7edac07d991d6595c0ac5c30e/tufte-common.def

clean-depends:
	${RM} tufte-common.def

### INCLUDES ###

INCLUDES= 	depend.mk tex.mk

define inc
ifeq ($(findstring $(1),${MAKEFILE_LIST}),)
$(1):
	wget https://raw.githubusercontent.com/dbosk/makefiles/master/$(1)
include $(1)
endif
endef
$(foreach i,${INCLUDES},$(eval $(call inc,$i)))
