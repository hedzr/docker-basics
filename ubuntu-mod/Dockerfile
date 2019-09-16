FROM ubuntu:bionic

#RUN apt update \
#    && apt install -y net-tools iputils-ping mc nano curl wget byobu jq htop lsof dnsutils inetutils-telnet \
#    && rm -rf /var/lib/apt/lists/*

# TZ: Asia/Chongqing
# curl byobu jq htop mc
RUN fetchDeps=" \
    		ca-certificates \
    		wget nano vim.tiny net-tools iputils-ping lsof dnsutils inetutils-telnet locales \
    	"; \
    TZ=Etc/UTC; LOCALE=en_US.UTF-8; \
    apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends ${fetchDeps} \
    && locale-gen $LOCALE \
    && cat /etc/default/locale && echo "Original TimeZone is: $(locale -a)" && date +'%z' \
    && ln -s /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ | tee /etc/timezone \
    && echo "Current TimeZone updated: $(locale -a)" && date +'%z' \
    # && apt-get purge -y --auto-remove ${fetchDeps} \
    && rm -rf /var/lib/apt/lists/*

## Debian series:
#RUN apt update \
#    && DEBIAN_FRONTEND=noninteractive apt install -y net-tools \
#    && apt clean \
#    && rm -rf /var/lib/apt
