FROM alpine:3

RUN apk add --no-cache iptables

WORKDIR /
COPY ./reflect.sh ./reflect.sh

ENTRYPOINT [ "./reflect.sh" ]