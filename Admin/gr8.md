# GR8

## HF or IDX

```bash
props.conf
[your_sourcetype]
TIME_PREFIX             = \<regex\>
MAX_TIMESTAMP_LOOKAHEAD = \<length\>
TIME_FORMAT             = \<strptime\>
SHOULD_LINEMERGE        = false
LINE_BREAKER            = \<regex\>
TRUNCATE                = 10000
```

Optional

```bash
TZ             = UTC
ANNOTATE_PUNCT = false
KV_MODE        = false
```

## UF

```bash
EVENT_BREAKER_ENABLE = true
EVENT_BREAKER        = \<regex\>
```
