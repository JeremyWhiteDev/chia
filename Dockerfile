FROM golang:1.22.0-bullseye
 
# Creates an app directory to hold your app’s source code
WORKDIR /app
 
# Copies all files from your root directory into /app
COPY . ./
 
# Installs Go dependencies
RUN go mod download

# Install Dev Dependencies
RUN go install github.com/cosmtrek/air@latest
 
# Builds your app with optional configuration (Only needed for production)
# RUN CGO_ENABLED=0 GOOS=linux go build -o chia
 
# # Tells Docker which network port your container listens on
EXPOSE 8080
 
# Specifies the executable command that runs when the container starts (production)
# CMD ./chia

# Specifies the executable command that runs when the container starts (localDev)
CMD air