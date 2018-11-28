FROM golang

ADD . /go/src/github.com/hunterlong/gethexporter
RUN cd /go/src/github.com/hunterlong/gethexporter && go get
RUN go install github.com/hunterlong/gethexporter

RUN mkdir /app
WORKDIR /app

ARG GETH
ENV GETH $GETH
ENV PORT 9090

EXPOSE 9090

ENTRYPOINT /go/bin/gethexporter
