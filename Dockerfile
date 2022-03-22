FROM golang:1.17.8-alpine3.15 AS builder
WORKDIR /build
ADD go.mod .
COPY . .
RUN go build -o gin-recipe main.go
FROM alpine:3.15
ENV MONGO_HOST=localhost
ENV MONGO_PORT=27017
ENV MONGO_USERNAME=admin
ENV MONGO_PASSWORD=password
WORKDIR /build
COPY --from=builder /build/gin-recipe /build/gin-recipe
CMD [". /gin-recipe"]