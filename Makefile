help:
	@cat Makefile

IMAGE_NAME="sbd_torch"
GPU?=0
DOCKER_FILE=Dockerfile
DOCKER=GPU=$(GPU) nvidia-docker

build:
	docker build . -t $(IMAGE_NAME) -f $(DOCKER_FILE)

bash:
	$(DOCKER) run -it --rm -v `pwd`:/sbd_torch -p 8888:8888 $(IMAGE_NAME) bash
