#!/usr/bin/env bash
HOST=localhost
PORT=9200
curl -XPUT http://${HOST}:${PORT}/cases --data-binary @index.json