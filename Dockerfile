FROM golang:1.22

WORKDIR /app

COPY . .

RUN go mod tidy
RUN go build -o pocketbase main.go

EXPOSE 8090

CMD ["./pocketbase", "serve", "--dir", "pb_data"]
