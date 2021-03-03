FROM ubuntu:focal

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-c"]

RUN apt-get update
RUN apt-get install -y git ssh curl wget

RUN curl -s https://packagecloud.io/install/repositories/fdio/hicn/script.deb.sh | bash
RUN curl -s https://packagecloud.io/install/repositories/fdio/release/script.deb.sh | bash

RUN apt-get update && apt-get install -y supervisor hicn-plugin libhicn \
            vpp-plugin-core  vpp libvppinfra libmemif libparc \
            libssh-4 openssl libpcre3 hicn-apps-memif hicn-utils-memif

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
  git \
  cmake \
  build-essential \
  clang \
  gdb \
  pkg-config \
  libconfig++-dev \
  libasio-dev \
  vpp-dev \
  libhicn-dev \
  libparc-dev \
  hicn-plugin-dev \
  libmemif-dev \
  libssh-dev \
  libssl-dev \
  libpcre3-dev \
  python3-ply \
  libgtest-dev \
  valgrind \
  --no-install-recommends 
  
RUN apt-get autoremove -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/*

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=
