# Datamodel Searches

## ES_CIM_Datamodels.spl

List the datamodels provided by 'Splunk_SA_CIM' app along with their whitelists and other useful information

## Datamodel_Indexes.spl

WIP, run the below to get a list of datamodels then '| tstats count from datamodel=Web by index' to find indexes per datamodel
Make it into a dashboard!

    | rest splunk_server=local /services/data/models 
    | search eai:type=datamodels eai:acl.app="Splunk_SA_CIM" 
    | fields title
