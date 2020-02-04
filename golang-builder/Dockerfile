FROM golang:1.13-alpine AS builder
LABEL maintainer="Hedzr Yeh <hedzrz@gmail.com>"

WORKDIR /go/src/docker-basic-builder/api

RUN ls -la \
    && fetchDeps=" \
           		ca-certificates \
           		make wget sed gawk \
           		git curl build-base autoconf automake libtool libstdc++ \
           	" \
    && apk --update add ${fetchDeps} \
    && rm /var/cache/apk/*

#RUN wget https://github.com/protocolbuffers/protobuf/releases/download/v3.9.1/protoc-3.9.1-linux-x86_64.zip \
#    && unzip protoc-3.9.1-linux-x86_64.zip \
#    && cp bin/protoc /go/bin/ \
#    && cp -R include/google ./
 
RUN git clone https://github.com/google/protobuf.git && \
        cd protobuf && \
        ./autogen.sh && \
        ./configure --prefix=/usr && \
        make && \
        make install && \
        ldconfig && \
        make clean && \
        cd .. && \
        rm -r protobuf && \
        cp /usr/bin/protoc /go/bin

RUN ls -la /go/bin \
    && ls -la ./


COPY ./Makefile ./
RUN make pb-deps

# adduser -D -g '' iotuser

