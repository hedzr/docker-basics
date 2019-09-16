
V=5-mod
VER=5.0-mod
VERSION=5.0.5-mod
TAG=hedzr/redis

.PHONY: build
build: ./Dockerfile
	docker build -t $(TAG):$(V) -t $(TAG):$(VER) -t $(TAG):$(VERSION) -t $(TAG):latest  .
	docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)
	docker push $(TAG):$(V)
	docker push $(TAG):$(VER)
	docker push $(TAG):$(VERSION)
	docker push $(TAG):latest
