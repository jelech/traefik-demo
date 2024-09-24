FROM golang:1.19-alpine3.18 as builder
WORKDIR /app
COPY . .
RUN go build -o server .
FROM alpine:latest
COPY --from=builder /app/server /server
CMD ["./server"]