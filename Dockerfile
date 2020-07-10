FROM alpine:3.12

RUN apk add --update --no-cache \
	openssl \
	sqlite \
	libzmq \
	libsodium \
	maven \
	openjdk11

# Maven setup
ENV JAVA_HOME=/usr/lib/jvm/default-jvm

# Copy libindy.so
ARG LIBINDY_PACKAGE="libindy_linux-x86_64-unknown-musl_1.15.0.tar.gz"

COPY ./dist/${LIBINDY_PACKAGE} .
RUN tar -C /usr/lib -xvf ${LIBINDY_PACKAGE} && rm ${LIBINDY_PACKAGE}
