#!/bin/sh
set -e

# Detect the OS and set the DISPLAY variable accordingly
if [ "$(uname)" = "Darwin" ]; then
    # macOS
    DISPLAY_VAR="docker.for.mac.host.internal:0"

    # Ensure XQuartz is running and configured
    defaults write org.xquartz.X11 enable_render_extension 0
    open -a XQuartz
    sleep 2
    xhost + localhost
else
    # Linux
    DISPLAY_VAR="$DISPLAY"
fi

# Remove existing container if it exists
sudo docker rm -f mars-container 2>/dev/null || true

# build a Docker image as per the configuration files (force rebuild)
sudo docker image build --rm \
                        -t polimi-mars-docker \
                        .

# create the Docker container from the image and start it
sudo docker run --mount type=bind,src="$(cd "$(dirname "$0")" ; pwd -P)",dst=/home/developer,ro=false \
                --mount type=bind,src=/tmp/.X11-unix,dst=/tmp/.X11-unix,ro=false \
                --mount type=bind,src=/etc/localtime,dst=/etc/localtime,ro=true \
                --name mars-container \
                -de DISPLAY="$DISPLAY_VAR" \
                polimi-mars-docker
