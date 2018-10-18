SOURCE=.
IMAGENAME=m3h7/monerod
MONERO_RELEASE=v0.13.0.2

.PHONY: all
all: usage

usage:
	@echo "Monerod Docker Build and Push"
	@echo "Usage:"
	@echo "  make pull				- Pull the base image"
	@echo "  make build				- Build the Docker image"
	@echo "  make REGISTRY=\"myregistry:5000\" push	- Push image to registry"
	@echo ""
	@echo "Change registry and image name in Makefile before build and push."

pull:
	docker pull centos:7

build:
	docker build --tag $(IMAGENAME) --build-arg MONERO_RELEASE=${MONERO_RELEASE} $(SOURCE)
	docker tag $(IMAGENAME) $(IMAGENAME):$(MONERO_RELEASE)

push: build
	docker tag $(IMAGENAME) $(REGISTRY)/$(IMAGENAME)
	docker tag $(IMAGENAME):$(MONERO_RELEASE) $(REGISTRY)/$(IMAGENAME):$(MONERO_RELEASE)
	docker push $(REGISTRY)/$(IMAGENAME)
	docker push $(REGISTRY)/$(IMAGENAME):$(MONERO_RELEASE)
