# OTel to Splunk Enterprise

1. EXTENSIONS
2. RECEIVERS
3. PROCESSORS
4. EXPORTERS

https://docs.splunk.com/Observability/gdi/opentelemetry/opentelemetry.html
https://github.com/signalfx/splunk-otel-collector

The Splunk Distribution of OpenTelemetry Collector is a distribution of the OpenTelemetry Collector. The distribution is a project that bundles components from OpenTelemetry Core, OpenTelemetry Contrib, and other sources to provide data collection for multiple source platforms. The customizations in the Splunk distribution include these features:

Better defaults for Splunk products

Fluentd for log capture

Tools to support migration from SignalFx products

# Sizing
You can scale up or out your Collector as needed. Use a ratio of 1 CPU to 2 GB of memory. By default, the Collector is configured to use 512 MiB, or 500 x 2^20 bytes, of memory.
A single Collector is generally capable of receiving, processing, or exporting the following amounts of data:

Traces: 15,000 spans per second
Metrics: 20,000 data points per second
Logs: 10,000 log records per second

https://github.com/open-telemetry/opentelemetry-collector-contrib/blob/main/receiver/hostmetricsreceiver/internal/scraper/pagingscraper/documentation.md
https://docs.datadoghq.com/tracing/trace_collection/open_standards/otel_collector_datadog_exporter/
