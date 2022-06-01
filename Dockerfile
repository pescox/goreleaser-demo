FROM golang:1.18 AS builder

WORKDIR /app
COPY . .
RUN go build -o demo main.go

FROM alpine

COPY --from=builder /app/demo /demo
ENTRYPOINT [ "/demo" ]