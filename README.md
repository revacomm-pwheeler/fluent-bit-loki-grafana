This is a very basic Fluent Bit, Loki, Grafana logging stack with a demonstration workload that generates a lot of logs. The purpose of this demonstration is to show that the [native Loki plugin](https://docs.fluentbit.io/manual/pipeline/outputs/loki) for Fluent Bit is disfunctional by default.

## Deployment

1. Create a Kubernetes cluster with a StorageClass named `gp2` (this is the default for an Amazon EKS cluster).
2. Deploy flux: `kustomize build ./flux | kubectl create -f -`
3. Run `kustomize build . | kubectl create -f -`

## Expected Behavior

Given this test workload consisting of two Pods generating a modest 1-2 log messages per second, Fluent Bit and Loki should easily be able to keep up and have logs available in Loki within a few seconds of when the Pod generates them.

## Actual Behavior

The logs available in Loki fall further and further behind (you can see this by running a query like `{namespace="example"}|json time,log|line_format "{{.log}}"|pattern "<_> <level> <msg>"` from Grafana).

## Dependencies

 * Flux v0.32.0
 * [Loki Helm Chart](https://github.com/grafana/helm-charts/tree/loki-2.13.1/charts/loki) v2.13.1 (App Version 2.6.0)
 * [Fluent Bit Helm Chart](https://github.com/fluent/helm-charts/tree/fluent-bit-0.20.4/charts/fluent-bit) v0.20.4 (App Version 1.9.6)
 * [Grafana Helm Chart](https://github.com/grafana/helm-charts/tree/grafana-6.32.17/charts/grafana) v6.32.17 (App Version 9.0.5)
