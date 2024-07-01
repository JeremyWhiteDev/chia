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

1. Fork the repo and Clone it to your local machine.
2. Use the vscode task `docker: watch dev` to start the dev containers (or use the command `docker compose -f compose.dev.yaml watch`)
3. To debug, use Run and Debug > Connect to Server
4. To quit, use the vscode task `docker: stop dev` (or use the the command `docker compose -f compose.dev.yaml stop`)

## Technical Docs

Please see the wiki describing _[Architecture and Technologies of Chia](https://github.com/JeremyWhiteDev/chia/wiki/Architecture-Snapshot)_ as well as information regarding _[Contributions](https://github.com/JeremyWhiteDev/chia/wiki/Contributing)_
