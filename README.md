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

1. [monitor](monitor)
   *+grafana, +prometheus, ...*

1. [nacos-std](nacos-std)
   nacos, *+mysql(master+salve), ~~+grafana, +prometheus~~, ...*
   
   - [nacos-local](nacos-local)
     nacos, *+mysql(master+salve), +grafana, +prometheus, ...*

1. [elasticsearch-std](elasticsearch-std)
   elasticsearch, *+cerebro, ...*

1. [skywalking-std](skywalking-std)
   skywalking

1. [zipkin-std](zipkin-std)
   zipkin, *+zipkin-mysql, +grafana, +prometheus, ...*

1. [kafka-std](kafka-std)
   kafka, *+zookeeper, +zk-web ...*

1. [mysql-master-slave](mysql-master-slave)
   mysql: master + slave


### run

```bash
make run-monitor
make run-nacos
# ...
```

### nacos guide

1. starting them

   ```bash
   make run-monitor
   make run-nacos
   # ...
   ```

2. initialize nacos monitor data

   following this guide: 
   - <https://nacos.io/zh-cn/docs/monitor-guide.html>
   - <https://nacos.io/en/docs/monitor-guide.html>





## Link to

- https://hub.docker.com/hedzr/
- https://hub.docker.com/hedzr/alpine
- https://hub.docker.com/hedzr/ubuntu
- https://hub.docker.com/hedzr/redis


## LICENSE

MIT

