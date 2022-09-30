#! /usr/bin/env bash

docker build --target plugin-build -t grafana-loki-plugin-build .
docker run -it --rm -v "$(pwd):/out:rw" grafana-loki-plugin-build -c 'cp clients/cmd/fluent-bit/out_grafana_loki.so /out'
