FROM golang:latest
ENV CGO_ENABLED 0

RUN apt-get update && apt-get install curl

COPY wait-for-it.sh /
RUN chmod +x /wait-for-it.sh

RUN mkdir /service

WORKDIR /service

CMD [ "readiness.sh" ]