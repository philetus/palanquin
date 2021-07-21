BUILD_DIR := /build

CONTAINER_NAME := palanquin
VERSION := 0.1.0
IMAGE_NAME := ${CONTAINER_NAME}:${VERSION}

default:
	@echo "Read the makefile"

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run \
		--restart unless-stopped \
		--name $(CONTAINER_NAME) \
		-d \
		$(IMAGE_NAME)

dev:
	docker run \
		--restart unless-stopped \
		--name $(CONTAINER_NAME) \
		--volume=$(PWD)/src:$(BUILD_DIR) \
		-d \
		$(IMAGE_NAME)

shell:
	docker exec -it $(CONTAINER_NAME) /bin/bash

stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)
