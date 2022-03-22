FROM golang:alpine AS builder
WORKDIR /build
ADD go.mod .
COPY . .
RUN go build -o gin-recipe main.go
FROM alpine
WORKDIR /build
COPY --from=builder /build/gin-recipe /build/gin-recipe
CMD [". /gin-recipe"]