# Splunk Features by Version

## Added

READ THIS AND UPDATE THE TABLE: https://medium.com/keylogged/from-splunk-5-x-to-7-0-just-what-have-you-been-missing-out-on-48d37065d60e

### Cloud

TBA

### Core

- https://docs.splunk.com/Documentation/Splunk/latest/ReleaseNotes/

| Version | Description |
| ------- | ----------- |
| 9.1 | Primary Assignment for S2 Bucket improvement |
| 9.1 | Federated Search improvements |
| 9.1 | Rolling SHC Upgrade |
| 9.1 | Ingest Actions improvements |
| 9.1 | Dashboard Studio improvements |
| 9.1 | Assist UI |
| 9.1 | TLS Certificates hot reload |
| 9.1 | UF Windows least privileged mode |
| 9.1 | DS scaling improvements |
| 9.1 | LM Redundancy |
| 9.1 | Home page redesign |
| 9.1 | Dark mode for Search app |
| 9.1 | Search History preserved across SHC |
| 9.1 | Distributed Health Report (green/red icon) |
| 9.1 | jQuery 3.5 is now the default |
| 9.0 | Bloomfilters for TSIDX (make this fast: "| tstats count WHERE index=* earliest=0 latest=now TERM(1.2.3.4) BY _time") |
| 9.0 | TLS warnings if not enabled for: CLI, Python, MongoDB, Hostname validation |
| 9.0 | UF Defaults to random password |
| 9.0 | UF Windows managed service account and group-managed service accounts |
| 9.0 | UF Least Privilege mode on Linux |
| 9.0 | KV Store requires WiredTiger (upgrade migrates automatically) |
| 9.0 | UF rest port changed from 0.0.0.0:8089 to localhost:8089 |
| 9.0 | Ingest Actions |
| 9.0 | Splunk Assist |
| 9.0 | CM Redundancy |
| 9.0 | SmartStore support for Azure (blob storage) |
| 9.0 | Role-based field filtering |
| 9.0 | _configtracker index |
| 9.0 | Default tsidxWritingLevel changed from 2-3 |
| 9.0 | TSIDX compression for SmartStore indexes |
| 9.0 | FS improvements (transparent mode, DMA and tstats) |
| 9.0 | MMDB changed from MaxMind to DB-IP Lite |
| 9.0 | API semantic versioning |
| 9.0 | Universal forwarder: Collect MacOS Unified Logging data	|
| 9.0 | Universal forwarder: Configuration changes are logged by default (configuration_change.log) |
| 9.0 | Python3 is now the default |
| 8.2.5 | HEC multithreaded |
| 8.2 | Federated Search |
| 8.2 | Dashboard Studio built in |
| 8.2 | KV Store backup/restore improvements (point in time) |
| 8.2 | Durable search |
| 8.2 | Configuration audit |
| 8.2 | jQuery 3.5 upgrade |
| 8.1.1 | Rapid Diag |
| 8.1.1 | Linux polkit rules for systemd |
| 8.1 | Ingest-time lookups |
| 8.1 | Metrics removed rawdata journal, only TSIDX |
| 8.1 | SmartStore 'lruk' cache eviction policy |
| 8.1 | Global banner notifications |
| 8.1 | UF HTTP Out |
| 8.1 | Conditional license enforcement |
| 8.1 | SPL comments: \`\`\`this is a comment\`\`\` |
| 8.1 | datetime.xml issue resolved |
| 8.1 | tsidxWritingLevel=4 added |
| 8.0.5 | New command: `require` |
| 8.0 | Python 3.7 support |
| 8.0 | Analytics Workspace |
| 8.0 | Shared data model acceleration summaries |
| 8.0 | New command option: `PREFIX` added to tstats |
| 8.0 | Cascading knowledge bundle replication |
| 8.0 | Metrics support multiple measurements per metric data point |
| 7.4 | Metrics rollups |
| 7.3 | Splunk Metrics Workspace in splunk |
| 7.3 | New command: `walklex` |
| 7.3 | tsidxWritingLevel=3 added |
| 7.2 | tsidxWritingLevel=2 added |
| 7.2 | journalCompression=zstd added |
| 7.2 | Workload Management |
| 7.2 | SmartStore |
| 7.2 | Ingest logs as metrics |
| 7.2 | Ingest-time eval-style extractions |
| 7.2 | Docker support |
| 7.2 | Dashboard dark theme |
| 7.2 | Customizable admin user name |
| 7.2 | splunk.secret change (from "RC4" $1$ to "AES256-GCM" $7$)
| 7.1 | Splunk Web user interface update |
| 7.1 | Upgrades to internal Splunk password capabilities (admin user must have non default password) |
| 7.1 | Parallel reduce search processing (new command: `redistribute`) |
| 7.1 | New commands: `mcollect`, `meventcollect` |
| 7.1 | Diag UI |
| 7.1 | KV store live backup and restore |
| 7.1 | Splunk Cloud DDSS |
| 7.0 | Metrics |
| 7.0 | Event annotations |
| 6.6 | New command: `union` |
| 6.6 | New SQL-like IN SPL operator |
| 6.6 | Trellis layout |
| 6.6 | Search Head Clustering user interface |
| 6.6 | Volume-based data forwarding |
| 6.6 | Change in default time range for Search (24h from all of time) |
| 6.5 | Datasets |
| 6.5 | Search syntax highlight, auto formatting and command completion |
| 6.5 | Edit XML inline and preview |
| 6.5 | Machine Learning Tool Kit |
| 6.5 | Hadoop Dataroll |
| 6.5 | Health Checks |
| 6.5 | Data rebalancing |
| 6.5 | UF: EVENT_BREAKER |
| 6.4 | Data sampling |
| 6.4 | TSIDX reduction |
| 6.4 | Authentication: SAML, Okta, Azure, ADFS |
| 6.3 | Multiple pipelines |
| 6.3 | Index and search improvements ~2x |
| 6.3 | Monitoring Console |
| 6.3 | Data Integrity |
| 6.3 | HTTP Event Collector |
| 6.2 | UI field extractor |
| 6.2 | KV Store added |
| 4.3 | Bloom filters added |
| 4.2 | UF added |

## Removed

| Removed Version | Deprecated Version | Description |
| --------------- | ------------------ | ----------- |
| 9.0 | 7.3 | Linux kernel 2.6 |
| 8.0 | 6.4 | Splunk Web legacy mode |
| 8.0 | 6.3 | Advanced XML |
| 8.0 | 6.2 | Search Head pooling |

## Deprecated

| Version | Description |
| ------- | ----------- |
| 9.0 | Python 2 |
| 9.0 | S2S protocol v3, Forwarders 5.x and lower are affected |
| 9.0 | master-apps directory, now called manager-apps |
| 8.2 | HTML dashboards |
| 8.1 | `msearch` replaced with `mpreview` |
| 6.0 | Light Forwarder: `SplunkLightForwarder` |
| 5.0 | File system change monitor: `fschange` |

## Versions of Interest

| Version | Description |
| ------- | ----------- |
| 8.1     | &gt;100 GB license enforcement |
| 7.2.2   | systemd temporarily made default on enable-boot |
| 7.1.10  | datetime.xml issue |
| 6.5     | No enforcement licenses available |

## Operating Systems

TBA
