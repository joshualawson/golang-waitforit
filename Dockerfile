FROM golang:latest
ENV CGO_ENABLED 0

RUN apt-get update && \
    apt-get install curl bash

COPY wait-for-it /usr/local/bin/
RUN chmod +x /usr/local/bin/wait-for-it

COPY readiness /usr/local/bin/
RUN chmod +x /usr/local/bin/readiness

RUN mkdir /service

WORKDIR /service