FROM alpine

MAINTAINER k4zuki


RUN apk --no-cache add -U \
    imagemagick wget curl openssl gcc libc-dev python3 py3-pillow libxml2-dev libxslt-dev python3-dev musl-dev \
    bash git

# RUN cabal update && cabal install pandoc pandoc-citeproc pandoc-crossref


ENV PANDOC_VERSION 2.1.3
ENV PANDOC_ARCHIVE pandoc-$PANDOC_VERSION
ENV PANDOC_URL https://github.com/jgm/pandoc/releases/download/$PANDOC_VERSION/
RUN wget --no-check-certificate $PANDOC_URL/$PANDOC_ARCHIVE-linux.tar.gz \
 && tar zxf $PANDOC_ARCHIVE-linux.tar.gz \
 && cp $PANDOC_ARCHIVE/bin/* /usr/local/bin \
 && rm -rf $PANDOC_ARCHIVE-linux.tar.gz $PANDOC_ARCHIVE

## Install haskell stack
# RUN wget https://github.com/commercialhaskell/stack/releases/download/v1.6.5/stack-1.6.5-linux-x86_64-static.tar.gz \
#  && tar zxf stack-1.6.5-linux-x86_64-static.tar.gz \
#  && cp stack-1.6.5-linux-x86_64-static/stack /usr/local/bin \
#  && rm -rf stack-1.6.5-linux-x86_64-static stack-1.6.5-linux-x86_64-static.tar.gz

# RUN wget --no-check-certificate https://github.com/alexpenson/pandoc-docx-pagebreak/archive/v1.tar.gz \
#  && tar zxf v1.tar.gz
# WORKDIR pandoc-docx-pagebreak-1
# RUN stack install --local-bin-path /usr/local/bin pandoc-docx-pagebreak

COPY bin/pandoc-docx-pagebreak /usr/local/bin

# ENV CROSSREF_VERSION v0.3.0.0
# ENV CROSSREF_ARCHIVE linux-ghc8-pandoc-2-0.tar.gz
# ENV CROSSREF_URL https://github.com/lierdakil/pandoc-crossref/releases/download/$CROSSREF_VERSION
# # RUN cabal update && cabal install pandoc-cross
# RUN wget --no-check-certificate $CROSSREF_URL/$CROSSREF_ARCHIVE && \
#     tar zxf $CROSSREF_ARCHIVE && \
#     mv pandoc-crossref /usr/local/bin/

COPY bin/pandoc-crossref-alpine /usr/local/bin/pandoc-crossref

RUN pip3 install panflute

# RUN wget -c https://github.com/tcnksm/ghr/releases/download/v0.5.4/ghr_v0.5.4_linux_amd64.zip && \
#     unzip ghr_v0.5.4_linux_amd64.zip && \
#     mv ghr /usr/local/bin/ && \
#     rm ghr_v0.5.4_linux_amd64.zip

# WORKDIR /var
# ENV PANDOC_MISC_VERSION 0.0.21
# RUN git clone --recursive --depth=1 -b $PANDOC_MISC_VERSION https://github.com/K4zuki/pandoc_misc.git
# RUN apk del *-doc

RUN apk del --purge
RUN rm -rf /var/cache/apk/*

RUN mkdir -p /workdir
WORKDIR /workdir
VOLUME ["/workdir"]
