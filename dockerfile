FROM golang:1.19-alpine AS builder
WORKDIR /app
COPY go.mod ./
COPY server.go ./
RUN go mod tidy && \
    go build

FROM alpine:latest
RUN apk --no-cache add curl
WORKDIR /root
COPY --from=builder /app ./
CMD ["./echo-server"]