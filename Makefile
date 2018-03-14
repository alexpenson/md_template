ifneq ($(shell git status -z),)
$(info uncommitted changes: exiting!)
all:
else
all:
	pandoc -r markdown --standalone --metadata=commit:$(shell git rev-parse --verify --short HEAD) --filter /Users/pensona/checkout/panflute/examples/panflute/metavars.py --filter pandoc-crossref --filter pandoc-citeproc --filter pandoc-docx-pagebreak --bibliography=paper.bib -o paper.docx paper.md
endif
