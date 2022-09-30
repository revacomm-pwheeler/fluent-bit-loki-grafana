#! /usr/bin/env bash

docker build . -t ghcr.io/revacomm-pwheeler/fluent-bit-grafana-loki:latest
docker push ghcr.io/revacomm-pwheeler/fluent-bit-grafana-loki:latest
