FROM golang:latest
ENV CGO_ENABLED 0

RUN apt-get update && \
    apt-get install curl bash

RUN mkdir /bin

COPY wait-for-it /
RUN chmod +x /bin/wait-for-it

COPY readiness /
RUN chmod +x /bin/readiness

ENV PATH="/bin:${PATH}"

RUN mkdir /service

WORKDIR /service