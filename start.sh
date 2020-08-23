#!/bin/zsh

#docker run -u=1000 -it -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/app -w /app fishsandbox fish
docker run -it -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/app -w /app fishsandbox fish
