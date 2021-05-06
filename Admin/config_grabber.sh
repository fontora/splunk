#/bin/bash

# /etc/apps to potentially ignore:
# grep -Ev "alert_logevent|alert_webhookappsbrowser|introspection_generator_addon|journald_input|launcher|learned|legacy|sample_app|search|SplunkForwarder|splunk_gdi|splunk_internal_metrics|SplunkLightForwarder|splunk_metrics_workspace|splunk_monitoring_console|splunk_rapid_diag|splunk_secure_gateway|user-prefs"

###############
## VARIABLES ##
###############

btool_exclude="grep -v system/default"
btool_opts="list --debug"
configs=("app" "authentication" "authorize" "fields" "indexes" "inputs" "limits" "outputs" "props" "server" "transforms" "web" "workload_policy" "workload_pools" "workload_rules")
date=$(date +"%Y%m%d_%H%M%S")
hostname=$(hostname)
paths_filter="*.conf"
splunk_path="/opt/splunk"

# Dynamic (order matters)
log="configs_${hostname}_${date}"
output="tee ${log}"
paths="${splunk_path}/etc/apps/ ${splunk_path}/etc/deployment-apps/ ${splunk_path}/etc/disabled-apps/ ${splunk_path}/etc/master-apps/ ${splunk_path}/etc/shcluster/ ${splunk_path}/etc/system/local/"
splunk_bin="${splunk_path}/bin/splunk"

##########
## MAIN ##
##########

echo -e "Collection starting\n"

echo -e "###########"
echo -e "## BTOOL ##"
echo -e "###########\n"
for config in ${configs[@]}; do
  echo -e "\n## ${config}.conf ##\n"
  ${splunk_bin} btool ${config} ${btool_opts} | ${btool_exclude} | ${output}
done
echo

echo -e "########"
echo -e "## LS ##"
echo -e "########\n"
find ${paths} -type f -name ${paths_filter} | ${output}

echo -e "\nCollection ended"

exit
