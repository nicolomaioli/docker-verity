FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

# Install requirements
RUN apt-get update && \
    apt-get install -y \
    apt-utils \
    software-properties-common \
    sqlite3 \
    maven \
    openjdk-11-jdk

# Static environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# Install libindy
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88 && \
    add-apt-repository "deb https://repo.sovrin.org/sdk/deb bionic stable" && \
    apt-get update && \
    apt-get install -y libindy
