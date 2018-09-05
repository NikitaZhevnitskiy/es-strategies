#!/usr/bin/env bash
HOST=localhost
PORT=9200
curl -XPUT http://${HOST}:${PORT}/cases/_mapping/case --data-binary @case.tipid.json
curl -XPUT http://${HOST}:${PORT}/cases/_mapping/tip-id-pattern --data-binary @tipid-pattern.json