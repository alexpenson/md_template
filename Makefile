ifneq ($(shell git status -z),)
$(info uncommitted changes: exiting!)
all:
else
all:
	suffix = $(shell date +"%F")
	commit_tag = $(shell git rev-parse --verify --short HEAD)
	output_name := paper-$(suffix)-$(commit_tag).docx
	docker run --rm \
	--volume $(shell pwd):/workdir \
	--tty alexpenson/pandocker-alpine \
	pandoc \
	-r markdown \
	--standalone \
	--metadata=commit:$(commit_tag) \
	--filter ./panflute/metavars.py \
	--filter pandoc-crossref \
	--filter pandoc-citeproc \
	--filter pandoc-docx-pagebreak \
	--bibliography=paper.bib \
	-o $(output_name) \
	paper.md
endif
