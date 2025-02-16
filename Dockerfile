FROM alpine:latest

# fonts for "standard tex tooling"
# Atkinson Hyperlegible font for std 'tex stuff'
WORKDIR /usr/local/texlive/texmf/local/fonts/opentype/Atkinson-Hyperlegible/
COPY fonts/Atkinson-Hyperlegible-* /usr/local/texlive/texmf/local/fonts/opentype/Atkinson-Hyperlegible/
# Atkinson Hyperlegible Next font for std 'tex stuff'
WORKDIR /usr/local/texlive/texmf/local/fonts/opentype/Atkinson-HyperlegibleNext/
COPY fonts/AtkinsonHyperlegibleNext-* /usr/local/texlive/texmf/local/fonts/opentype/Atkinson-HyperlegibleNext/
# Atkinson Hyperlegible font for std 'tex stuff'
WORKDIR /usr/local/texlive/texmf/local/fonts/opentype/Atkinson-HyperlegibleMono/
COPY fonts/AtkinsonHyperlegibleMono-* /usr/local/texlive/texmf/local/fonts/opentype/Atkinson-HyperlegibleMono/
# DejaVu Sans Mono font for std 'tex stuff'
WORKDIR /usr/local/texlive/texmf/local/fonts/truetype/DejaVuSans/
COPY fonts/DejaVuSans* /usr/local/texlive/texmf/local/fonts/truetype/DejaVuSans/

# fonts for xetex
WORKDIR /root/.fonts
# Atkinson Hyperlegible fonts for xetex
COPY fonts/Atkinson-Hyperlegible* /root/.fonts
COPY fonts/AtkinsonHyperlegible* /root/.fonts
# DejaVu Sans Mono font for xetex
COPY fonts/DejaVuSans* /root/.fonts

# Actual working directory
WORKDIR /opt/document-conversion

# Use bash instead of sh to avoid confusion / problems
ENTRYPOINT ["/bin/bash"]

# Install software
#    - may need to run mktexlsr after texlive is installed
#    - running mktexlsr only be necessary if fonts added *after* texlive is installed
RUN apk update && apk upgrade \
    && apk add bash \
    && apk add pandoc py3-pandocfilters \
    && apk add texlive-full
