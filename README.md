
# VSCode configuration files

This repository contains configuration files used by vscode to create a container
ready for compiling/debuggin/testing the hicn stack.

## Hot to use

Install Docker on your development machine (https://docs.docker.com/) and run it.

Clone the hicn software stack:

```bash
git clone https://github.com/Fdio/hicn && cd hicn
```

Add this repo under the folder `.devcontainer` inside the hicn repository:

```bash
git submodule add git@github.com:icn-team/devcontainer.git .devcontainer
```

Open VSCode and install the extension Remote - Containers (id: ms-vscode-remote.remote-containers).
Then press `ctrl + shift + p` and write `Remote-Containers: Reopen in Container`.

Give to the docker the time to build the container and you are done :)