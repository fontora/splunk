# Upgrade Order

- https://docs.splunk.com/images/d/d3/Splunk_upgrade_order_of_ops.pdf
- https://lantern.splunk.com/Splunk_Platform/Product_Tips/Enterprise/Upgrading_Splunk_Enterprise

1. Deployment Server
2. License Manager
3. Cluster Manager
4. Monitoring Console
5. Deployer
6. Search Heads (inc. SHC)
7. Indexers

## Apps

Upgrade Splunk Core first, then apps.

## Verification

- **DS:** Config reload successful, clients phoning home
- **LM:** Indexers checking in, forwarding to indexing tier
- **CM:** Cluster is searchable, fix-ups done, search peers stable
- **MC:** All nodes present, passes Health Check, verify search, verify indexing
- **Deployer:** Able to push bundles to all SHC nodes
- **SH:** External auth, apps, search works, users can login
- **IDX:** Receiving data, fix-up tasks completed, searches work
