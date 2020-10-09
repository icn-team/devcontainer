FROM ubuntu:focal

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Or your actual UID, GID on Linux if not the default 1000
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Use bash shell
SHELL ["/bin/bash", "-c"]

# Configure apt and install packages
RUN apt-get update \
  && apt-get -y install --no-install-recommends \
    cmake cppcheck valgrind curl git libtool  	\
    libconfuse-dev git-review exuberant-ctags cscope pkg-config	python3-all \
    python3-setuptools python-dev python3-virtualenv python3-pip  check \
    libboost-all-dev libffi-dev python3-ply ninja-build uuid-dev 	\
    python3-jsonschema gdb libssl-dev python3-setuptools zsh 				\
    valgrind libasio-dev libparc-dev libasio-dev libconfig-dev 
  && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
  # Install hicn libs && C++ tools
  #&& curl -s https://packagecloud.io/install/repositories/fdio/release/script.deb.sh | bash \
  #&& curl -s https://packagecloud.io/install/repositories/fdio/hicn/script.deb.sh | bash \
  #&& apt-get -y update \
  #&& apt-get -y install build-essential cmake cppcheck valgrind libasio-dev libparc-dev \
  #libconfig-dev vpp libvppinfra vpp-plugin-core libmemif libmemif-dev \
  #vpp-dev vpp-plugin-dpdk libparc libparc-dev python3-ply python python-ply \
  #
  # Create a non-root user to use if preferred - see https://aka.ms/vscode-remote/containers/non-root-user.
  && groupadd --gid $USER_GID $USERNAME \
  && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
  # [Optional] Uncomment the next three lines to add sudo support
  # && apt-get install -y sudo \
  # && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  # && chmod 0440 /etc/sudoers.d/$USERNAME \
  #
  # Clean up
  && apt-get autoremove -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/*

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=
