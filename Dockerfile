# =============================================================================
# Custom XeLaTeX Environment for Lab SRS Documentation
# Base: ghcr.io/mrdvd/xetex-base (Ubuntu-based)
# Purpose: Compiling Russian-language RUP/SRS documents with XeLaTeX
# =============================================================================

FROM ghcr.io/mrdvd/xetex-base:latest

RUN \
  apt-get update && \
  apt install -y make fonts-cmu && \
  tlmgr update --self && \
  tlmgr install \
    babel-english \
    babel-russian \
    hyperref \
    titlesec \
    etoolbox && \
  apt-get clean