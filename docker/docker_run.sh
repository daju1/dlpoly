#!/bin/sh

set -e
set -x

DISPLAY=$(env | grep DISPLAY= | sed 's/DISPLAY=//')
export DISPLAY=$DISPLAY
PROJECT_ROOT=$(dirname ${PWD})
workspace_dir=$(dirname $(dirname $(dirname "$(pwd)")))/articles
workspace_dir2=$(dirname $(dirname $(dirname $(dirname "$(pwd)"))))/moldyn
workspace_dir3=$(dirname $(dirname $(dirname $(dirname "$(pwd)"))))/md

DOCKER_IMAGE=ubuntu_dlpoly_build:20.04

docker run -it --rm --name dlpoly_build_container --cap-add=NET_ADMIN --device /dev/net/tun \
    --workdir=${PWD} \
    -v ${PROJECT_ROOT}:${PROJECT_ROOT} \
    -v /home/${USER}/.ssh/id_rsa:/home/${USER}/.ssh/id_rsa \
    -v /home/${USER}/.ssh/id_rsa.pub:/home/${USER}/.ssh/id_rsa.pub \
    -v /home/${USER}/.ssh/known_hosts:/home/${USER}/.ssh/known_hosts \
    -e DISPLAY=:0 --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --user ${USER}:${USER} ${DOCKER_IMAGE} /bin/bash


