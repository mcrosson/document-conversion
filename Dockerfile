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
# Monaspace Argon
WORKDIR /usr/local/texlive/texmf/local/fonts/opentype/MonaspaceArgon/
COPY fonts/Monaspace/Argon/* /usr/local/texlive/texmf/local/fonts/opentype/MonaspaceArgon/
# Monaspace Krypton
WORKDIR /usr/local/texlive/texmf/local/fonts/opentype/MonaspaceKrypton/
COPY fonts/Monaspace/Krypton/* /usr/local/texlive/texmf/local/fonts/opentype/MonaspaceKrypton/
# Monaspace Neon
WORKDIR /usr/local/texlive/texmf/local/fonts/opentype/MonaspaceNeon/
COPY fonts/Monaspace/Neon/* /usr/local/texlive/texmf/local/fonts/opentype/MonaspaceNeon/
# Monaspace Radon
WORKDIR /usr/local/texlive/texmf/local/fonts/opentype/MonaspaceRadon/
COPY fonts/Monaspace/Radon/* /usr/local/texlive/texmf/local/fonts/opentype/MonaspaceRadon/
# Monaspace Xenon
WORKDIR /usr/local/texlive/texmf/local/fonts/opentype/MonaspaceXenon/
COPY fonts/Monaspace/Xenon/* /usr/local/texlive/texmf/local/fonts/opentype/MonaspaceXenon/

# fonts for xetex
WORKDIR /root/.fonts
# Atkinson Hyperlegible fonts for xetex
COPY fonts/Atkinson-Hyperlegible* /root/.fonts
COPY fonts/AtkinsonHyperlegible* /root/.fonts
# DejaVu Sans Mono font for xetex
COPY fonts/DejaVuSans* /root/.fonts
# Monaspace fonts for xetex
COPY fonts/Monaspace/*/* /root/.fonts

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
