FROM golang:1.19-alpine AS builder
WORKDIR /app
COPY go.mod ./
COPY server.go ./
RUN go mod tidy && \
    go build

FROM alpine:latest
WORKDIR /root
COPY --from=builder /app ./
CMD ["./echo-server"]