FROM debian:bullseye-slim as plugin-build

# Enable Backports for golang-1.17 package
RUN echo deb http://deb.debian.org/debian bullseye-backports main contrib >> /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      golang-1.17 \
      bash \
      vim \
      git \
      make \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

ENV GIT_SSL_NO_VERIFY=true
ENV PATH="$PATH:/usr/lib/go-1.17/bin"

WORKDIR /src/loki

RUN git clone https://github.com/grafana/loki.git .
RUN git checkout v2.6.1
RUN make fluent-bit-plugin

FROM cr.fluentbit.io/fluent/fluent-bit:1.9.8

COPY --from=plugin-build /src/loki/clients/cmd/fluent-bit/out_grafana_loki.so /usr/lib/
