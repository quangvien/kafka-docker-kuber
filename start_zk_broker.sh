#!/bin/sh
nohup /kafka/bin/zookeeper-server-start.sh kafka/config/zookeeper.properties &
nohup /kafka/bin/kafka-server-start.sh kafka/config/server.properties & 
