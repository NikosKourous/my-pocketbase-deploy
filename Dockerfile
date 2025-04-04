FROM golang:1.21-alpine AS build 
WORKDIR /app 
COPY . . 
RUN go install github.com/pocketbase/pocketbase@latest 
 
FROM alpine:latest 
WORKDIR /app 
COPY --from=build /go/bin/pocketbase /app/pocketbase 
COPY pb_data ./pb_data 
COPY public ./public 
EXPOSE 8090 
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8090"] 
