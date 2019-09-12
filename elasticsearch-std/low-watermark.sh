#!/bin/sh

curl -XPUT -H "Accept: application/json"  -H "Content-Type: application/json" localhost:9200/_cluster/settings -d '{
    "transient" : {
        "cluster.routing.allocation.disk.threshold_enabled" : false
    }
}'
