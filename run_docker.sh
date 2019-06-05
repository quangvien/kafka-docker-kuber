#!/bin/sh
KAFKA_VER="2.2.1"
sudo docker run -td --network=host gcr.io/spring-docker-kuber/kafka:$KAFKA_VER
