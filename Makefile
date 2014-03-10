PT=pdflatex
IDX=makeindex
BIBX=bibtex

all: wsi.pdf

wsi.pdf:
	${PT} -shell-escape "\input{wsi.tex}"
	${IDX} -s wsi.ist -t wsi.slg -o wsi.syi wsi.syg
	${IDX} -g -s style.mki wsi.idx
	${BIBX} wsi
	${PT} -shell-escape "\input{wsi.tex}"
	${PT} -shell-escape "\input{wsi.tex}"
	${PT} -shell-escape "\input{wsi.tex}"
	${PT} -shell-escape "\input{wsi.tex}"	#yeah, this looks to much, but i experienced, that 3-times is not enough

update-toc:
	doctoc .

clean:
	rm -rf *.aux *.log *.toc *.pdf *.idx *.out *.ilg *.ind *.slg *.ist *.syi *.gnuplot *.glo *.syg *.table
