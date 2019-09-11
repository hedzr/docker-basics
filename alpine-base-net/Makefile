
V=3-net
VER=3.10-net
VERSION=3.10.3-net
TAG=hedzr/alpine

build:
	docker build -t $(TAG):$(V) -t $(TAG):$(VER) -t $(TAG):$(VERSION) -t $(TAG):latest  .
	docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)
	docker push $(TAG):$(V)
	docker push $(TAG):$(VER)
	docker push $(TAG):$(VERSION)
	docker push $(TAG):latest
