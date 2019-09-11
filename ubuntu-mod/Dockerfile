FROM ubuntu:bionic

RUN apt update \
    && apt install -y net-tools iputils-ping mc nano curl wget byobu jq htop lsof dnsutils inetutils-telnet \
    && rm -rf /var/lib/apt/lists/*

RUN fetchDeps=" \
    		ca-certificates \
    		wget nano net-tools iputils-ping mc nano curl wget byobu jq htop lsof dnsutils inetutils-telnet \
    	"; \
    apt update \
    && apt install -y --no-install-recommends ${fetchDeps} \
    # && apt-get purge -y --auto-remove ${fetchDeps} \
    && rm -rf /var/lib/apt/lists/*

## Debian series:
#RUN apt update \
#    && DEBIAN_FRONTEND=noninteractive apt install -y net-tools \
#    && apt clean \
#    && rm -rf /var/lib/apt
