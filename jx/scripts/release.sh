#!/usr/bin/env bash

export DOCKER_REGISTRY=docker.io

jx step next-version --use-git-tag-only > VERSION

export VERSION=$(cat VERSION)
echo "Creating docker image version: $VERSION"

docker build -t ${DOCKER_REGISTRY}/jenkinsxio/xunit-viewer:$VERSION .
docker push ${DOCKER_REGISTRY}/jenkinsxio/xunit-viewer:$VERSION

echo
echo "pushing new version to git tag.."

jx step tag --version $VERSION

echo
echo "pushed docker image: ${DOCKER_REGISTRY}/jenkinsxio/xunit-viewer:$VERSION"
echo "you can browse the versions here: https://hub.docker.com/r/jenkinsxio/xunit-viewer/"

