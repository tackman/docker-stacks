#!/bin/sh
docker run --runtime=nvidia --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v "$PWD":/home/jovyan/work tackman/tensorflow-notebook:latest
