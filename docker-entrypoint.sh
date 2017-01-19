#!/bin/bash

DIR=/docker-entrypoint.d

chmod -R +x "$DIR"

if [[ -d "$DIR" ]]
then
  echo "=== BEGIN initialization scripts ==="
  /bin/run-parts -v "$DIR"
  echo "=== END initialization scripts   ==="
fi

exec "$@"