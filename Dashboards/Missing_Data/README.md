# Missing Data

Shows a list of hosts over 24 hours, and a count of their events over the last 15 minutes

    | tstats count where index=foo earliest=-15m@m by host, _time span=1m
    | sort -_time
    | stats max(_time) as _time, first(count) as count by host
    | append
      [| tstats values(host) as host where index=foo earliest=-1d@d | mvexpand host | eval count=0, _time=0 ]
    | stats max(_time) as _time, max(count) as count by host
    | eval time=if(_time=0, null(), _time)