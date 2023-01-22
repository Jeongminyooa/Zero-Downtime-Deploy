#!/bin/bash

DOCKER_IMAGE_NAME=mytamla

DOCKER_CONTAINER_NAME=mytamla-web-service

docker build -t ${DOCKER_IMAGE_NAME} . #  프로젝트 루트 경로에 대한 상대경로

docker run -d -p 8081:8080 --name ${DOCKER_CONTAINER_NAME} ${DOCKER_IMAGE_NAME}