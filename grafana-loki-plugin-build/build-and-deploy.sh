#! /usr/bin/env bash

docker build . -t ghcr.io/revacomm-pwheeler/fluent-bit-loki-grafana/fluent-bit-grafana-plugin:latest
docker push ghcr.io/revacomm-pwheeler/fluent-bit-loki-grafana/fluent-bit-grafana-plugin:latest
