# Dockerized MARS

Run the MIPS Assembler and Runtime Simulator (MARS) in a Docker container without needing to install Java on your machine. Works on GNU/Linux, macOS, and Windows.

This uses [myMARS](https://github.com/yutotakano/myMARS) by Yuto Takano, which is an improved version with bug fixes and enhancements.

**Note:** If you're on Apple Silicon, this includes rendering fixes for XQuartz (see [XQuartz issue #31](https://github.com/XQuartz/XQuartz/issues/31)).

## Prerequisites

You'll need [Docker](https://docs.docker.com/install) installed.

**macOS users:** You also need XQuartz for X11 forwarding. [This guide](https://gist.github.com/sorny/969fe55d85c9b0035b0109a31cbcb088) walks you through the setup.

**Linux users:** This only works with Xorg. Wayland and Mir aren't supported.

## Setup

```bash
git clone https://github.com/emiliodallatorre/polimi-mars-docker.git
cd polimi-mars-docker
chmod +x ./start.sh
sudo ./start.sh
```

The script needs sudo to access the Docker daemon.

## Important

MARS can only see files in the `./polimi-mars-docker` directory. It won't be able to open files from anywhere else on your computer because of how Docker [bind mounts](https://docs.docker.com/storage/bind-mounts) work. Just put your `.asm` files in this directory before running the script.

## Troubleshooting

**Display issues on macOS?** Make sure XQuartz is running and that you've run `xhost +localhost`.

**Permission errors on Linux?** Add yourself to the docker group:
```bash
sudo usermod -aG docker $USER
newgrp docker
```

## License

See the [LICENSE](LICENSE) file. This project uses the MARS license from the original developers.
