#!/bin/bash
mkdir -p $HOME/docker/xupnpdv2/listas
docker run -d \
        --name Xupnpdv2 \
        --network host \
        --restart always \
        -v $HOME/docker/xupnpdv2/listas:/xupnpd2/media \
        lordpedal/xupnpdv2
