#!/bin/zsh

docker run -u=1000 -it -v $(pwd):/app -w /app fishsandbox $1 $2 $3
