# Zenko Backbeat Test Module

This is a development/test stack !

Please setup the stack first as described here: https://github.com/scality/Zenko/tree/master/swarm-production 

In order to use the stack you must first log into the kafka container (docker exec -it container_id bash)
and create the zookeeper namespace and kafka topic:

```
bin/zookeeper-shell.sh localhost:2181/backbeat
create /replication-populator my_data
quit
```

```
bin/kafka-topics.sh --create \
--zookeeper localhost:2181/backbeat \
--replication-factor 1 \
--partitions 1 \
--topic backbeat-replication
```
