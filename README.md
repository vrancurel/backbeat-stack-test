# Zenko Post-Processing Example Module

This is a development stack !

In order to use the stack you must first log into the kafka container
and create the zookeeper namespace and kafka topic:

```
bin/zookeeper-shell.sh localhost:2181
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
