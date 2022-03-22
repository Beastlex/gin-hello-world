FROM golang:1.17.8-alpine3.15 AS builder
WORKDIR /build
ADD go.mod .
COPY . .
RUN go build -o gin-recipe main.go
FROM alpine:3.15
WORKDIR /build
COPY --from=builder /build/gin-recipe /build/gin-recipe
CMD [". /gin-recipe"]