default: messages.pdf

TEX_PRE=llncs.cls splncs04.bst sources.bib
TEX_DEPS=$(patsubst %,%.tex,\
  intro model structured doublesatisfaction\
  messages-spec messages-apps\
  discussion appendix)

%.pdf : %.tex $(TEX_PRE) $(TEX_DEPS)
	pdflatex -halt-on-error $<
	bibtex $* &> /dev/null
	pdflatex -halt-on-error $<
	bibtex $* &> /dev/null
