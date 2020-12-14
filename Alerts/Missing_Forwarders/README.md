# INSTRUCTIONS

Save the below search as an Alert under the Monitoring Console context, triggering say every 30 minutes.

    | inputlookup dmc_forwarder_assets 
    | fields hostname, forwarder_type, version, os, arch, status, last_connected 
    | search status="missing" NOT 
        [| inputlookup dmc_assets 
        | dedup serverName 
        | rename serverName as hostname 
        | fields hostname] 
    | `dmc_rename_forwarder_type(forwarder_type)` 
    | eval offline_duration=tostring(now()-last_connected, "duration"),
        last_connected=strftime(last_connected, "%F %T %z")
    | rename hostname as Instance, forwarder_type as Type, version as Version, os as OS, arch as Architecture, status as Status, last_connected as "Last Connected to Indexers", offline_duration as "Offline Duration"
