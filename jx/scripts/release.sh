#!/usr/bin/env bash

export DOCKER_REGISTRY=docker.io

export VERSION=$(jx step next-version)
echo "Creating docker image version $VERSION"

docker build -t ${DOCKER_REGISTRY}/jenkinsxio/xunit-viewer:$VERSION .
docker push ${DOCKER_REGISTRY}/jenkinsxio/xunit-viewer:$VERSION