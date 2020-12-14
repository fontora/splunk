# INSTRUCTIONS

Set the below scheduled search to run every 5 minutes on the DS

    | rest /services/deployment/server/clients splunk_server=local
    | outputlookup forwarders.csv
