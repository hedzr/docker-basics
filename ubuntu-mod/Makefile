
V=bionic-mod
VER=18-mod
VERSION=18.04-mod
TAG=hedzr/ubuntu

build:
	docker build -t $(TAG):$(V) -t $(TAG):$(VER) -t $(TAG):$(VERSION) -t $(TAG):latest  .
	docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)
	docker push $(TAG):$(V)
	docker push $(TAG):$(VER)
	docker push $(TAG):$(VERSION)
	docker push $(TAG):latest
