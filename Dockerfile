FROM arm32v6/alpine:3.8

COPY * /socketcand/
WORKDIR /socketcand

RUN apk add --no-cache autoconf make gcc libconfig libconfig-dev musl-dev linux-headers \
 && autoconf \
 && ./configure --enable-rc-script \
 && make \
 && apk del autoconf make gcc libconfig-dev musl-dev linux-headers \
 && rm -rf /var/cache/apk/*

ENTRYPOINT ["./socketcand"]
CMD ["-i", "can0"]

EXPOSE  29536