FROM golang:1.11-alpine AS build
ENV GO111MODULE on
COPY . /go/src/github.com/rafa-acioly/fastcep
WORKDIR /go/src/github.com/rafa-acioly/fastcep
RUN apk --update add alpine-sdk git && \
  go build -o /fastcep main.go

FROM alpine:latest

COPY --from=build /fastcep /fastcep

EXPOSE 3000
CMD ["/fastcep"]
