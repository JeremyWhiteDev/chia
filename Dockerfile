FROM golang:1.22
 
# Creates an app directory to hold the app's source code
WORKDIR /app
 
# Copies all files from the root directory into /app
COPY . ./
 
# Installs Go dependencies
RUN go mod download

# Installs Dev Dependencies
# TODO This only applies to dev
RUN go install github.com/cosmtrek/air@latest
RUN go install github.com/go-delve/delve/cmd/dlv@latest
 
# Builds the app with optional configuration
# TODO This only applies to production
# RUN CGO_ENABLED=0 GOOS=linux go build -o chia
 
# Tells Docker which network port the container listens on
EXPOSE 8080
EXPOSE 2345 

 # Specifies the executable command that runs when the container starts
# TODO This only applies to production
# CMD ./chia

# Specifies the executable command that runs when the container starts
# TODO This only applies to dev
CMD air