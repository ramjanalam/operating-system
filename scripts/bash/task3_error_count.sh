#!/bin/bash

if [ ! -f server.log ]; then
  echo "server.log not found"
  exit 1
fi

grep -c "Error" server.log
