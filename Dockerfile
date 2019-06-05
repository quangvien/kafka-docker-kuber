FROM ubuntu:latest
EXPOSE 9092
ARG KAFKA_VER=2.2.1
ARG SCALA_VER=2.12
ARG MIRROR=http://mirror.downloadvn.com/apache
RUN apt-get -y update
RUN apt-get -y install wget
RUN apt-get -y install openjdk-8-jre
RUN apt-get -y install zookeeperd

RUN wget ${MIRROR}/kafka/${KAFKA_VER}/kafka_${SCALA_VER}-${KAFKA_VER}.tgz && tar xvf kafka_${SCALA_VER}-${KAFKA_VER}.tgz --one-top-level=kafka --strip-components=1
RUN rm kafka_${SCALA_VER}-${KAFKA_VER}.tgz

COPY start_zk_broker.sh start_zk_broker.sh
COPY server.properties ./kafka/config/server.properties
CMD ["/bin/bash", "/start_zk_broker.sh", "&", "/bin/bash", "&"]
