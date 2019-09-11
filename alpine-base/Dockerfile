FROM alpine:3.10.2
LABEL maintainer Hedzr Yeh <hedzrz@gmail.com>


#RUN apk --update add git less openssh && \
#    rm -rf /var/lib/apt/lists/* && \
#    rm /var/cache/apk/*

# git openssh

#RUN apk update && apk upgrade && \
#    apk add --no-cache bash less nano iputils bind-tools busybox-extras && \
#    rm -rf /var/lib/apt/lists/* && \
#    rm /var/cache/apk/*

# && apk -v cache clean \



RUN fetchDeps=" \
    		ca-certificates \
    		bash less nano iputils bind-tools busybox-extras \
    		wget curl lsof \
    	"; \
    apk update \
    && apk --update add ${fetchDeps} \
    && apk info -vv | sort \
    && rm -rf /var/lib/apt/lists/* \
    && rm /var/cache/apk/*

CMD ["bash"]
