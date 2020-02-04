-include .env
# ref: https://kodfabrik.com/journal/a-good-makefile-for-go/

PROJECTNAME=$(shell basename "$(PWD)")
APPNAME=$(shell grep -E "AppName[ \t]+=[ \t]+" doc.go|grep -Eo "\\\".+\\\"")
VERSION=$(shell grep -E "Version[ \t]+=[ \t]+" doc.go|grep -Eo "[0-9.]+")

# Go related variables.
GOBASE = $(shell pwd)
#GOPATH="$(GOBASE)/vendor:$(GOBASE)"
#GOPATH=$(GOBASE)/vendor:$(GOBASE):$(shell dirname $(GOBASE))
GOPATH2= $(shell dirname $(shell dirname $(shell dirname $(GOBASE))))
GOPATH1= $(shell dirname $(GOPATH2))
ifneq ($(wildcard $(GOPATH2)/src),)
	GOPATH = $(GOPATH2)
else
	GOPATH = $(HOME)/go
endif
GOBIN  = $(GOBASE)/bin
GOFILES= $(wildcard *.go)
BIN    = $(GOPATH)/bin
GOLINT = $(BIN)/golint
GOCYCLO= $(BIN)/gocyclo
GOYOLO = $(BIN)/yolo

GO111MODULE=on
GOPROXY=https://goproxy.io # https://athens.azurefd.net

# Redirect error output to a file, so we can show it in development mode.
STDERR=/tmp/.$(PROJECTNAME)-stderr.txt

# PID file will keep the process id of the server
PID=/tmp/.$(PROJECTNAME).pid

# Make is verbose in Linux. Make it silent.
MAKEFLAGS += --silent

#
LDFLAGS=
M = $(shell printf "\033[34;1m▶\033[0m")
ADDR = ":5q5q"
SERVER_START_ARG=server run
SERVER_STOP_ARG=server stop


goarch=amd64
W_PKG=github.com/hedzr/cmdr/conf
TIMESTAMP=$(shell date -u '+%Y-%m-%d_%I:%M:%S%p')
GITHASH=$(shell git rev-parse HEAD)
GOVERSION=$(shell go version)
LDFLAGS=-s -w -X '$(W_PKG).Buildstamp=$(TIMESTAMP)' -X '$(W_PKG).Githash=$(GITHASH)' -X '$(W_PKG).GoVersion=$(GOVERSION)' -X '$(W_PKG).Version=$(VERSION)' -X '$(W_PKG).AppName=$(APPNAME)'



GRPC_GATEWAY  = $(GOPATH)/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis
GO_ANNOTATION = google/api/annotations.proto


export PATH := $(BIN):$(PATH)



## pb: compile proto buffer

pb-deps: | $(BASE) $(GRPC_GATEWAY) $(BIN)/protoc $(BIN)/protoc-gen-go $(BIN)/protoc-gen-swagger $(BIN)/protoc-gen-grpc-gateway $(GO_ANNOTATION) $(BIN)/golint $(BIN)/gocyclo $(BIN)/yolo
	ls -la $(BIN)/
	echo done

$(GRPC_GATEWAY): | $(BASE)
	[ -f go.mod ] || go mod init temp
	@GOPATH=$(GOPATH) GOBIN=$(BIN) GO111MODULE=$(GO111MODULE) GOPROXY=$(GOPROXY) \
	go get -v github.com/grpc-ecosystem/grpc-gateway
	$(MAKE) tidy

google/api:
	@-mkdir -p google/api

$(GO_ANNOTATION): | google/api
	curl https://raw.githubusercontent.com/googleapis/googleapis/master/google/api/annotations.proto > google/api/annotations.proto     
	curl https://raw.githubusercontent.com/googleapis/googleapis/master/google/api/http.proto > google/api/http.proto

$(BIN)/protoc:
	wget https://github.com/protocolbuffers/protobuf/releases/download/v3.9.1/protoc-3.9.1-linux-x86_64.zip
	unzip protoc-3.9.1-linux-x86_64.zip
	cp bin/protoc $(BIN)/
	cp include/google ./

$(BIN)/protoc-gen-grpc-gateway:
	[ -f go.mod ] || go mod init temp
	@GOPATH=$(GOPATH) GOBIN=$(BIN) GO111MODULE=$(GO111MODULE) GOPROXY=$(GOPROXY) \
	go get -v github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
	$(MAKE) tidy

$(BIN)/protoc-gen-swagger:
	[ -f go.mod ] || go mod init temp
	@GOPATH=$(GOPATH) GOBIN=$(BIN) GO111MODULE=$(GO111MODULE) GOPROXY=$(GOPROXY) \
	go get -v github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
	$(MAKE) tidy

$(BIN)/protoc-gen-go:
	[ -f go.mod ] || go mod init temp
	@GOPATH=$(GOPATH) GOBIN=$(BIN) GO111MODULE=$(GO111MODULE) GOPROXY=$(GOPROXY) \
	go get -v github.com/golang/protobuf/protoc-gen-go
	@GOPATH=$(GOPATH) GOBIN=$(BIN) GO111MODULE=$(GO111MODULE) GOPROXY=$(GOPROXY) \
	go install -v github.com/golang/protobuf/protoc-gen-go
	$(MAKE) tidy


## install: Install missing dependencies. Runs `go mod download` internally.
install: info go-mod-download

## tidy: Go Module Tidy
tidy:
	@GOPATH=$(GOPATH) GOBIN=$(BIN) GO111MODULE=$(GO111MODULE) GOPROXY=$(GOPROXY) \
	go mod tidy




$(BIN)/golint: | $(GOBASE)   # # # ❶
	@echo "  >  installing golint ..."
	#@-mkdir -p $(GOPATH)/src/golang.org/x/lint/golint
	#@cd $(GOPATH)/src/golang.org/x/lint/golint
	#@pwd
	@GOPATH=$(GOPATH) GO111MODULE=$(GO111MODULE) GOPROXY=$(GOPROXY) \
	go get -v golang.org/x/lint/golint
	@echo "  >  installing golint ..."
	@GOPATH=$(GOPATH) GO111MODULE=$(GO111MODULE) GOPROXY=$(GOPROXY) \
	go install golang.org/x/lint/golint
	@cd $(GOBASE)

$(BIN)/gocyclo: | $(GOBASE)  # # # ❶
	@echo "  >  installing gocyclo ..."
	@GOPATH=$(GOPATH) GO111MODULE=$(GO111MODULE) GOPROXY=$(GOPROXY) \
	go get -v github.com/fzipp/gocyclo

$(BIN)/yolo: | $(GOBASE)     # # # ❶
	@echo "  >  installing yolo ..."
	@GOPATH=$(GOPATH) GO111MODULE=$(GO111MODULE) GOPROXY=$(GOPROXY) \
	go get -v github.com/azer/yolo

$(BASE):
	# @mkdir -p $(dir $@)
	# @ln -sf $(CURDIR) $@



info:
	@echo "     GOBASE: $(GOBASE)"
	@echo "      GOBIN: $(GOBIN)"
	@echo "     GOPATH: $(GOPATH)"
	@echo "GO111MODULE: $(GO111MODULE)"
	@echo "    GOPROXY: $(GOPROXY)"
	@echo "    APPNAME: $(APPNAME)"
	@echo "    VERSION: $(VERSION)"
	@echo

.PHONY: help
all: help
help: Makefile
	@echo
	@echo " Choose a command run in "$(PROJECTNAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo