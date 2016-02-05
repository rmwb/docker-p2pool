#!/bin/bash
set -e

docker=$(which docker)

case "$1" in
  install)
    "$docker" pull rossbennetts/docker-p2pool:latest
    ;;
  start)
    "$docker" run -d -p 0.0.0.0:7903:7903 --env-file=env-mainnet --name p2pool rossbennetts/docker-p2pool:latest
    ;;
  stop)
    "$docker" stop p2pool
    ;;
  start-testnet)
    "$docker" run -d -p 0.0.0.0:17903:17903 --env-file=env-testnet --name p2pool-testnet rossbennetts/docker-p2pool:latest
    ;;
  stop-testnet)
    "$docker" stop p2pool-testnet
    ;;

  uninstall)
    "$docker" rm p2pool
    "$docker" rm p2pool-testnet
    "$docker" rmi rossbennetts/docker-p2pool
    ;;
  *)
    echo "Usage: $0 [install|start|stop|start-testnet|stop-testnet|uninstall]"
    exit 1
    ;;
esac

