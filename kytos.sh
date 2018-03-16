#!/bin/bash

echo "Initializing kytosd"
if [[ -e /var/run/kytos/kytosd.pid ]]; then
  echo "Removing existent kytosd.pid"
  rm -rf /var/run/kytos/kytosd.pid
fi
kytosd -f
