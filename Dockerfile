# Start with an official Go base image
FROM golang:1.23

# Set the working directory inside the container
WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download all dependencies
RUN go mod tidy

# Copy the rest of the application code
COPY . .

# Build the application
RUN go build -o /app/pocketbase

# Expose the port for the server
EXPOSE 8090

# Command to run the application
CMD ["/app/pocketbase", "serve"]
