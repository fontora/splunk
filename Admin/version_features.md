# Splunk Features by Version

## Added

### Cloud

| Version | Description |
| ------- | ----------- |
| 8.2.2202 | ? |

### Core

- https://docs.splunk.com/Documentation/Splunk/latest/ReleaseNotes/

| Version | Description |
| ------- | ----------- |

| 9.0 | ? |

TLS - CLI
TLS - Python
TLS - MongoDB
TLS - hostname validation
UF Defaults to random password
UF Windows managed service account and group-managed service accounts
UF Least Privilege mode on Linux (YESSSSSSSSSSSSSSS)
WiredTiger required.. upgrade does it for you
UF rest port changed from 0.0.0.0:8089 to localhost:8089 

ingest actions
splunk assist
CM reudndancy
SmartStore support for Azure (blob storage)
Role-based field filtering
_configtracker index
default tsidx changed from 2-3
TSIDX compression for SmartStore indexes
Bucket Merge functionality for clustered peer instances
FS improvements (transparent mode, DMA and tstats)
MMDB changed from MaxMind to DB-IP Lite
API semantic versioning
Universal forwarder: Collect MacOS Unified Logging data	
Universal forwarder: Configuration changes are logged by default (configuration_change.log)


| 8.2 | Federated Search |
| 8.2 | Dashboard Studio built in |
| 8.2 | KV Store backup/restore improvements (point in time) |
| 8.2 | Durable search |
| 8.2 | Configuration audit |
| 8.1.1 | Rapid Diag |
| 8.1.1 | Linux polkit rules for systemd |
| 8.1 | Ingest-time lookups |
| 8.1 | Metrics removed rawdata journal, only TSIDX |
| 8.1 | SmartStore 'lruk' cache eviction policy |
| 8.1 | Global banner notifications |
| 8.1 | UF HTTP Out |
| 8.1 | Conditional license enforcement |
| 8.1 | SPL comments: \`\`\`this is a comment\`\`\` |
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
| 7.2 | workload management |
| 7.2 | SmartStore |
| 7.2 | Ingest logs as metrics |
| 7.2 | Ingest-time eval-style extractions |
| 7.2 | Docker support |
| 7.2 | Dashboard dark theme |
| 7.2 | Customizable admin user name |

| 7.2 | splunk.secret change                xxxxxxxxxxxxxxxxxx .. also datexml issues XXXXXXXXXXXXX jquery 3.5?

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
| 6.5 | UF: EVENT_BRKEAER |
| 6.4 | Data sampling |
| 6.4 | TSIDX reduction |
| 6.4 | Authentication: SAML, Okta, Azure, ADFS |
| 6.3 | Multiple pipelines
| 6.3 | Index and search improvements ~2x |
| 6.3 | Monitoring Console |
| 6.3 | Data Integrity |
| 6.3 | HTTP Event Collector |
| 6.2 | UI field extractor |

## Removed

| Removed Version | Deprecated Version | Description |
| --------------- | ------------------ | ----------- |
| 8.0 | 6.4 | Splunk Web legacy mode |
| 8.0 | 6.3 | Advanced XML |
| 8.0 | 6.2 | Search Head pooling |

## Deprecated

| Version | Description |
| ------- | ----------- |
| -   | Python 2.7 (it's [complicated](https://docs.splunk.com/Documentation/Splunk/latest/Python3Migration)) |
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
