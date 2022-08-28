Did a bunch of digging and this seems to be a good place to start.
Most of the examples of batch sizes I found were 5MB or below.
Have you been watching the connection/socket count on the Indexers? As you said, make sure it doesn't spiral out of control.

inputs.conf
[http]
# 8.1.7/8.2.4/9.0.0 and above
dedicatedIoThreads = 8
maxThreads=100000
maxSockets=50000
# Useful when HEC clients are using connection pools and want to keep connections idle.
# Set it 2 times expected idle time of connection.
busyKeepAliveIdleTimeout = 300
# Useful when HEC clients are using connection pools and want to keep connections idle.
# Set it 2 times expected idle time of connection.
# Supported from M-release for cloud and on-prem 8.2.0
sslServerSessionTimeout = 300

[http://<TOKEN>]
queueSize=10MB

server.conf
[general]
parallelIngestionPipelines = 2

[queue=httpInputQ]
maxSize = 100MB

Check this link out for the maxThreads and maxSockets. Might need to fiddle with that based on the limits set in systemd (or however you are setting limits):
https://docs.splunk.com/Documentation/Splunk/9.0.1/Troubleshooting/HTTPthreadlimitissues#Override_automatic_socket_and_thread_configuration
