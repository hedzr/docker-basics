#!/bin/sh

curl -XPUT -H 'Content-Type: application/json' 'localhost:9200/_settings' -d '
{
    "index" : {
        "number_of_replicas" : 0
    }
}'

# https://stackoverflow.com/questions/21157466/all-shards-failed



# extras
cat >/dev/nul<<EOT
curl -XPUT 'http://localhost:9200/_all/_settings?preserve_existing=true' -d '{
  "index.merge.scheduler.max_thread_count" : "1",
  "index.number_of_replicas" : "0",
  "index.refresh_interval" : "300s",
  "index.translog.durability" : "async",
  "index.translog.sync_interval" : "120s"
}'
EOT
