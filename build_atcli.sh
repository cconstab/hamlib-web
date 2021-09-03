#!/bin/bash
# docker version needs be greater than 19.0.3.0
# user docker --version to check the installed version
export DOCKER_BUILDKIT=1
docker build --file at_cli/Dockerfile --output ./ .