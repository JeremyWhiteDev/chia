# Chia

Chia is a small but mighty application for keeping track of the precious things you own!

🚧🚧🚧 Under Construction 🚧🚧🚧

### The Problem

Ever had to create a spread sheet of all your most precious items for home owners or renter's insurance? No? Well, you probably should and just haven't. Any number of things can happen in real life (flood, tornado, theft) where your most precious and expensive items can be lost. Usually, when submitting a police report or insurance claim, it is best to provide all the information you can about an item:

- Proof of purchase
- Photos
- Serial/Model Numbers
- Value

Organizing this all in a spreadsheet can be time consuming, and keeping the data organized can be so annoying!

That's where Chia comes in.

### The Solution

Chia aims to provide a sleek user interface for tracking all the above information. Say goodbye to that annoying spreadsheet!

## Running the Production App via Docker

Currently, this is a single container app, and can be installed directly from docker/hub and run with a single command:
_Make sure docker engine is running on your machine._

```
docker pull jwhitedev/chia-web
docker run --rm \
    -p <port>:8080
    --name chia
    jwhitedev/chia-web
```

where `<port>` is the port you want to run the web app on.

Shortly, this will be a multicontainer app and may require multiple docker commands to run or a docker compose file.

## Local Development

1. Clone the repo
2. use the vscode task `docker: watch dev` to start the dev containers.
3. To debug, use Run and Debug > Connect to Server
4. To quit, use the vscode task `docker: stop dev`

## Debugging in Local Development

Chia is developed in vscode. All the necessary launch/debug configs can be found in this repo. The design of the local development docker container may have compatibility issues with other debug clients.

The process that runs the go application in the local development container is Delve, the same process that the vs-code plugin expects to attach to.

Within the container, Air, a file watcher, manages building and executing the go application. When source code files are changed during development, Air automatically rebuilds the project, and delegates the execution of the binary to Delve. When delve executes the binary, unfortunately, any current debug session connected to the execution of a previous version of the binary is closed. This is a known limititation of the vscode-go debug experience, as there is no way to setup automatic reconnection of the debugger.

### Technologies Used

To keep chia small, it will use:

- Docker (for portability)
- MySQL (Upcoming)
- Golang (Upcoming)
- HTMX (Upcoming)
- TailwindCSS (Upcoming)
- Vanilla JS
- Firebase

_Docker:_ Even though we want this to be small, we also want this to be very portable. We don't want developers to have to worry about environment setup. We also want dev to mirror production as closely as possible. Running the application in a container also provides another level of virtualizaton, so that the host server can be run on any OS that is compatible with Docker.

_MySQL:_ Used it before. There's enough new stuff here, so let's keep the db choice easy.

_Golang:_ This is a new technology for me, but I chose it for the 0 dependencies that it requires to get a basic web server up and running. Golang also has an excellent DX with built-in code formatting and LSP support.

_HTMX:_ I want a little bit of interactivity, but I also want to keep the amount of handwritten js to a minimum.

_Tailwind CSS:_ I know. Wasn't this supposed to be no dependencies and no crazy build steps? You're right. But remember, it's not only important this app is small, it's important it's _fast_ to develop. I have witnessed the savings from using something like TailwindCSS outwieghing the costs. Yes, there will be an additional build step. But the sheer fluidity that comes from using tailwind during development is tough to beat. And at least this is a build dependency, not a runtime dependency. And because of how tailwind works, there will be no difference for end users between using tailwind and using handwritten css, since the tailwind CLI compiles and minifies only the necessary CSS into a static asset that will be served up just like a handwritten css file.

_Vanilla JS:_ It's inevitable that we will have to write some level of javascript. This might be for the certain interactions like opening a modal. Whenever required, we'll write a small amount of js to handle those interactions.

_Firebase for Auth:_ I've used firebase in other projects, but have always used the firebase SDKs. I chose to use firebase's REST APIs so as not to have a runtime dependency on the firebase SDKs. However, this choice resulted in the need for a different ryntime dependency (go-jwt) for parsing/verifying the jwt. However, this was a reasonable tradeoff because a) I wanted to become more familiar with jwt handling, and b) this library's scope is much narrower. If the library needs updating, it's more likely those updates will be security related.

_Firebase for Image hosting:_ this is the easy choice for blob storage since I'm already using the firebase platform for auth. I can utilize the firebase storage REST APIs for uploading the images, eliminating another runtime dependcy to the firebase storage SDK.
