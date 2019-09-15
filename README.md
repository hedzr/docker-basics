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
   etcd, *+etcdkeeper(-mod), +db (**mysql:8**), +cache (**redis 5**), ...*
   
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
# start premetreus and grafana
make run-monitor

# start nacos (and an embedded mysql master+slave)
make run-nacos

# start zipkin (and an embedded mysql)
make run-zipkin

# start etcd, mysql 8 (for biz-logic), and redis 5
make run-etcd

# start elasticsearch
make run-es

# start skywalking (after `make run-es`)
make run-skyw

# ...
```

### nacos guide

1. starting them

   ```bash
   make run-monitor
   make run-nacos
   # ...
   ```
   
   open <http://localhost:8848/nacos> and login with `nacos/nacos`.
   
   monitor:
   - open grafana at http://localhost:13000/
   - open prometheus at http://localhost:9090/, *and search `nacos-monitor` to lookup nacos data*. 

2. initialize nacos monitor data

   following this guide: 
   - <https://nacos.io/zh-cn/docs/monitor-guide.html>
   - <https://nacos.io/en/docs/monitor-guide.html>



### skywalking guide

1. starting them

   ```bash
   make run-es
   make run-skyw
   # ...
   ```
   
   open <http://localhost:18080/>.
   


### zipkin guide

1. starting them

   ```bash
   make run-monitor
   make run-zipkin
   # ...
   ```
   
   open <http://localhost:9411/>.
   
   monitor:
   - open grafana at http://localhost:13000/
   - open prometheus at http://localhost:9090/ 




## Link to

- https://hub.docker.com/hedzr/
- https://hub.docker.com/hedzr/alpine
- https://hub.docker.com/hedzr/ubuntu
- https://hub.docker.com/hedzr/redis


## LICENSE

MIT

