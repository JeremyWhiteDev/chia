#!/bin/bash
# cd ../

./tailwindcss -i style/input.css -o style/output.css --watch &

air

wait -n

# Exit with status of process that exited first
exit $?