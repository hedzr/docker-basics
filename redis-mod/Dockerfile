#FROM debian:stretch-slim
FROM redis:5.0.5

# see also:
#  https://hub.docker.com/_/redis/

#    		dirmngr \
#    		gnupg \
RUN fetchDeps=" \
    		ca-certificates \
    		wget nano net-tools iputils-ping mc nano curl wget byobu jq htop lsof dnsutils inetutils-telnet \
    	"; \
    apt update \
    && apt install -y --no-install-recommends ${fetchDeps} \
    # && apt-get purge -y --auto-remove ${fetchDeps} \
    && rm -rf /var/lib/apt/lists/*
COPY redis.conf /redis.conf
CMD ["redis-server", "/redis.conf"]
