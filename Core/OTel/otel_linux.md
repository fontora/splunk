agent_config.yaml

##########
## DOCS ##
##########

# https://github.com/signalfx/splunk-otel-collector/blob/main/docs/components.md
# https://docs.splunk.com/Observability/gdi/index.html#nav-Configure-application-receivers

# Logs:
# journalctl -u splunk-otel-collector
# grep otelcol /var/log/messages

# systemctl status splunk-otel-collector

# https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/receiver/hostmetricsreceiver
# CPU, Disk, Load, Filesystem, memory, network, paging, processes, process

# zpages
# http://13.236.32.92:55679/debug/servicez

#http://13.236.32.92:13133/ ?
#
# https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/extension/healthcheckextension
#

#https://docs.datadoghq.com/tracing/trace_collection/open_standards/otel_collector_datadog_exporter/

################
## EXTENSIONS ##
################
# Tasks that do not involve processing data

extensions:
  health_check:
    endpoint: 0.0.0.0:13133
  pprof:
    endpoint: :1888
  zpages:
    endpoint: :55679

###############
## RECEIVERS ##
###############
# How data gets in

receivers:
  hostmetrics:
    collection_interval: 10s
    scrapers:
      cpu:
      disk:
      filesystem:
      memory:
      network:
      load:
      paging:
      processes:
      # System processes metrics, disabled by default
      # process:
  # https://docs.splunk.com/Observability/gdi/collectd/collectd-uptime.html#collectd-uptime
  smartagent/collectd/uptime:
    type: collectd/uptime
  # https://docs.splunk.com/Observability/gdi/chrony/chrony.html#chrony
  smartagent/chrony:
    type: collectd/chrony

################
## PROCESSORS ##
################
# Process data between being received and being exported

processors:
  batch:

###############
## EXPORTERS ##
###############
# How data sent to one or more backends/destinations

exporters:
  # https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/exporter/splunkhecexporter
  splunk_hec:
    token: "XXX"
    endpoint: "https://localhost:8088/services/collector"
    source: "otel"
    sourcetype: "otel"
    index: "test_metrics"
    tls:
      insecure_skip_verify: true
    splunk_app_name: "testy"
    splunk_app_version: "v0.0.1"

  # Debug
  logging:
    loglevel: debug

#############
## SERVICE ##
#############
# Configure what components are enabled

service:
  extensions: [pprof, zpages, health_check]
  pipelines:
    metrics:
      receivers: [hostmetrics, smartagent/collectd/uptime, smartagent/chrony]
      processors: [batch]
      exporters: [splunk_hec]
