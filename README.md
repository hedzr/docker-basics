# Basic Docker Images

## Images

1. [alpine-base](alpine-base) 
   alpine, *+bash, ping, telnet, dig, ...*

1. [ubuntu-mod](ubuntu-mod) 
   ubuntu, *+bash, ping, telnet, dig, ...*

1. [redis-mod](redis-mod) 
   redis, *+bash, ping, telnet, dig, ...*

## Composes

1. [etcd-std](etcd-std)
   etcd, *+etcdkeeper(-mod), +db, +cache, ...*
   
   - [lite-etcd-std](etcd-std/lite-etcd-std)
     etcd, *+etcdkeeper, ...*

1. [nacos-std](nacos-std)
   nacos, *+mysql(master+salve), +grafana, +prometheus, ...*
   
   - [nacos-local](nacos-local)
     nacos, *+mysql(master+salve), +grafana, +prometheus, ...*

1. [elasticsearch-std](elasticsearch-std)
   elasticsearch, *+cerebro, ...*

1. [skywalking-std](skywalking-std)
   skywalking


## Link to

- https://hub.docker.com/hedzr/
- https://hub.docker.com/hedzr/alpine
- https://hub.docker.com/hedzr/ubuntu
- https://hub.docker.com/hedzr/redis


## LICENSE

MIT

