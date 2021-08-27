# GR8

## HF or IDX

```dosini
props.conf
[your_sourcetype]
TIME_PREFIX             = <regex>
MAX_TIMESTAMP_LOOKAHEAD = <length>
TIME_FORMAT             = <strptime>
SHOULD_LINEMERGE        = false
LINE_BREAKER            = <regex>
TRUNCATE                = 10000
```

Optional

```dosini
TZ             = UTC
ANNOTATE_PUNCT = false
KV_MODE        = false
```

## UF

```dosini
props.conf
EVENT_BREAKER_ENABLE = true
EVENT_BREAKER        = <regex_same_as_SHOULD_LINEMERGE>
```
