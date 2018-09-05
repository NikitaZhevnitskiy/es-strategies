#!/usr/bin/env bash
HOST=localhost
PORT=9200
curl -XPUT http://${HOST}:${PORT}/cases/_mapping/case --data-binary @case.detail.priority.json
curl -XPUT http://${HOST}:${PORT}/cases/_mapping/priority --data-binary @priority.json
