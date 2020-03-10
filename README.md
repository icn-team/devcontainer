
# VSCode configuration files

This repository contains configuration files used by vscode to create a container
ready for compiling/debuggin/testing the hicn stack.

## How to use

Install Docker on your development machine (https://docs.docker.com/) and run it.

Clone the hicn software stack:

```bash
git clone https://github.com/Fdio/hicn && cd hicn
```

Add this repo under the folder `.devcontainer` inside the hicn repository:

```bash
git submodule add git@github.com:icn-team/devcontainer.git .devcontainer
```

Open VSCode and install the extension `Remote - Containers` (id: `ms-vscode-remote.remote-containers`).
Then press `ctrl + shift + p` and write `Remote-Containers: Reopen in Container`.

Give to the docker the time to build the container and you are done :)

## Connect two containers running vpp with memif

Mount the same folder in the two containers, VPP1 and VPP2 (devcontainer.json mounts /tmp/memif in the folder /memif inside the container)

Run vpp and access the vppctl in both VPP1 and VPP2.

```
vpp -c /etc/vpp/startup.conf &
vppctl
```

Create a memif socket in the shared folder from VPP1, create a master memif, set the interface up and configure an ip address

```
create memif socket id 1 filename /memif/memif1.sock
create interface memif id 0 socket-id 1 master
set int state memif1/0 up
set int ip addr memif1/0 192.168.1.1/24
```

Create a memif socket in the shared folder from VPP2 and create a slave memif

```
create memif socket id 1 filename /memif/memif1.sock
create interface memif id 0 socket-id 1 slave
set int state memif1/0 up
set int ip addr memif1/0 192.168.1.2/24
```

Enjoy :)