SOURCE=.
REGISTRY=spurv:5000
IMAGENAME=mahiso/monerod
MONERO_RELEASE=v0.10.3.1

.PHONY: all
all: usage

usage:
	@echo "Monerod Docker Build and Deploy"
	@echo "Usage:"
	@echo "  make build: Build the Docker image"
	@echo "  make deploy: Deploy image to registry"

build:
	docker build --tag $(IMAGENAME):$(MONERO_RELEASE) $(SOURCE)

deploy: build
	docker tag $(IMAGENAME):$(MONERO_RELEASE) $(REGISTRY)/$(IMAGENAME):$(MONERO_RELEASE)
	docker push $(REGISTRY)/$(IMAGENAME):$(MONERO_RELEASE)
 