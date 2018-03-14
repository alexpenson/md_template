## Markdown template

### Install

```
brew install pandoc pandoc-citeproc pandoc-crossref
```

Install haskell in order to install the pandoc-docx-pagebreak filter
```
brew install haskell-stack

git clone git@github.com:alexstoick/pandoc-docx-pagebreak.git
cd pandoc-docx-pagebreak
stack install --local-bin-path /usr/local/bin pandoc-docx-pagebreak
```

Install panflute (python filters) http://scorreia.com/software/panflute/

Must use python3
```
pip install panflute
```

https://gist.github.com/maxogden/97190db73ac19fc6c1d9beee1a6e4fc8
