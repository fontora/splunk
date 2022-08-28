# Syslog

yum install policycoreutils-python
semanage port -a -t syslogd_port_t -p udp 8514
firewall-cmd --permanent --add-port=8514/udp
firewall-cmd --reload
firewall-cmd --list-all
