# Dockerized MARS

## Introduction

The MIPS Assembler and Runtime Simulator (MARS) is a good program for running (simulated) MIPS assembly code. If you want to get it up and running quickly (without installing Java on your host system), this is the tool for you. It contains configuration used to spin up MARS in a Docker container, whether you are running on GNU/Linux, macOS, or Windows.

This project uses an improved version of MARS called [myMARS](https://github.com/yutotakano/myMARS) by Yuto Takano and, which includes enhancements and bug fixes over the original MARS simulator.

**Note:** This implementation includes Java rendering optimizations to address XQuartz display issues on Apple Silicon, as discussed in [XQuartz issue #31](https://github.com/XQuartz/XQuartz/issues/31).

## Prerequisites

### All Platforms

Docker [must be installed](https://docs.docker.com/install).

### macOS

On macOS, you need to install XQuartz for X11 forwarding. Follow the instructions at [this guide](https://gist.github.com/sorny/969fe55d85c9b0035b0109a31cbcb088) to set up XQuartz properly.

### GNU/Linux

This will only work if you are running an Xorg display server on your host machine. Wayland and Mir are not directly supported.

## Important Notes

The MARS program will only be able to see assembly programs that are contained in the `./polimi-mars-docker` directory. You will **not** be able to browse for files that are just anywhere on your computer. This is because we are [bind mounting](https://docs.docker.com/storage/bind-mounts) the [`./polimi-mars-docker` directory](https://github.com/emiliodallatorre/polimi-mars-docker/blob/main/start.sh) into the Docker container.

## Setup

```sh
git clone https://github.com/emiliodallatorre/polimi-mars-docker
cd polimi-mars-docker
chmod +x ./start.sh
sudo ./start.sh
```

Running `start.sh` as sudo is required because connecting to the Docker daemon socket requires superuser privileges.
