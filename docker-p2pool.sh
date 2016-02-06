#!/bin/bash
set -e

docker=$(which docker)

case "$1" in
  install)
    "$docker" pull rossbennetts/docker-p2pool:latest
    ;;
  start)
    "$docker" run -d -p 0.0.0.0:9332:9332 --env-file=env-p2pool --name p2pool rossbennetts/docker-p2pool:latest
    ;;
  stop)
    "$docker" stop p2pool
    ;;

  uninstall)
    "$docker" rm p2pool
    "$docker" rmi rossbennetts/docker-p2pool
    ;;
  *)
    echo "Usage: $0 [install|start|stop|uninstall]"
    exit 1
    ;;
esac

