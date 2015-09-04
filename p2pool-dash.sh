#!/bin/bash
set -e

docker=$(which docker)

case "$1" in
  install)
    "$docker" pull thelazier/p2pool-dash:latest
    ;;
  start)
    "$docker" run -d -p 0.0.0.0:7903:7903 --name p2pool-dash thelazier/p2pool-dash:latest
    ;;
  stop)
    "$docker" stop p2pool-dash
    ;;
  uninstall)
    "$docker" rm p2pool-dash
    "$docker" rmi thelazier/p2pool-dash
    ;;
  *)
    echo "Usage: $0 [install|start|stop|uninstall]"
    exit 1
    ;;
esac

