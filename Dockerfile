# =============================================================================
# Custom XeLaTeX Environment for Lab SRS Documentation
# Base: ghcr.io/mrdvd/xetex-base (Ubuntu-based)
# Purpose: Compiling Russian-language RUP/SRS documents with XeLaTeX
# =============================================================================

FROM ghcr.io/mrdvd/xetex-base:2026

RUN \
  apt-get update && \
  apt-get install -y make fonts-cmu && \
  # fixes error "Local TeX Live (YYYY-1) is older than remote repository (YYYY)"
  curl -sSL http://mirror.ctan.org/systems/texlive/tlnet/update-tlmgr-latest.sh -o update-tlmgr-latest.sh && \
  sh update-tlmgr-latest.sh && rm update-tlmgr-latest.sh && \
  # # # # #
  tlmgr update --self && \
  tlmgr install \
    babel-english \
    babel-russian \
    hyphen-russian \
    hyperref \
    titlesec \
    etoolbox \
    tools \
    float \
    pgf && \
  apt-get clean

# installs TikZ-UML package
# (https://perso.ensta.fr/~kielbasi/tikzuml/index.php)
RUN \
  apt-get install -y bzip2 && \
  curl -sSL https://perso.ensta.fr/~kielbasi/tikzuml/var/files/src/tikzuml-v1.0-2016-03-29.tbz -o tikzuml.tbz && \
  tar -xjf tikzuml.tbz && rm tikzuml.tbz && \
  mkdir -p $(kpsewhich -var-value=TEXMFHOME)/tex/latex && \
  mv tikzuml-v1.0-2016-03-29/tikz-uml.sty $(kpsewhich -var-value=TEXMFHOME)/tex/latex && \
  rm -r tikzuml-v1.0-2016-03-29 && \
  apt-get remove -y bzip2 && \
  apt-get autoremove -y && \
  apt-get clean && \
  tlmgr install \
    xstring \
    pgfopts