#!/usr/bin/env bash
DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
CONTAINER_NAME = pygotham2018_graphmining
IMAGE_NAME = pygotham2018_graphmining
IMAGE_TAG = 0.1
TARGET_DIR=/home/jovyan/work
PORT = 8888

########################################################################################################

build:
	docker build --rm \
				 -t ${IMAGE_NAME}:${IMAGE_TAG} \
				 -f ${DIR}/Dockerfile \
				 ${DIR}
stop_local:
	docker container rm -f ${CONTAINER_NAME} 2>/dev/null || true

test_python:
	docker container run --tty \
	                     --rm \
	                     --mount type=bind,source="${DIR}",target=${TARGET_DIR} \
						 ${IMAGE_NAME}:${IMAGE_TAG} \
						 python --version

get_logs:
	docker logs -f ${CONTAINER_NAME}

run_notebook:
	docker container run --rm \
						 --name ${CONTAINER_NAME} \
						 -p ${PORT}:${PORT} \
						 --mount type=bind,source="${DIR}",target=${TARGET_DIR} \
						 ${IMAGE_NAME}:${IMAGE_TAG}

run_notebook_volume:
	docker container run --rm \
						 --name ${CONTAINER_NAME} \
						 -p ${PORT}:${PORT} \
						 -v ${DIR}:${TARGET_DIR} \
						 ${IMAGE_NAME}:${IMAGE_TAG}

