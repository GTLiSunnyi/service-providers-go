FROM golang-alpine as builder

WORKDIR /app
ADD . .

RUN make install

FROM golang-alpine

COPY --from=builder /go/bin/random-seed-sp /usr/local/bin

ENTRYPOINT ["random-seed-sp", "start"]
