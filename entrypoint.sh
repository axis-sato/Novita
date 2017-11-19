#!/usr/bin/env bash

cd /data

c="json-server --watch db.json"

if [ -f routes.json ]; then
  c="$c --routes routes.json"
fi

$($c)
