#!/bin/sh -x

IMG="rcdfrd/samba-docker"

PLATFORM="linux/amd64"

ALPINE_VERSION="3.16"
SAMBA_VERSION="4.15.7-r0"

docker build -q --no-cache -t "$IMG:a$ALPINE_VERSION-s$SAMBA_VERSION" --push .

echo "$@" | grep "release" 2>/dev/null >/dev/null && echo ">> releasing new latest" && docker buildx build -q --pull --platform "$PLATFORM" -t "$IMG:latest" --push .
