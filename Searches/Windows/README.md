# Searches:Windows

| File | Description |
| ---- | ----------- |
| [macros_blocked-internet.spl](macros_blocked-internet.spl | x |
| [macros_trusted-locations.spl](macros_trusted-locations.spl) | x |
| [macros_vba-warnings.spl](macros_vba-warnings.spl) | x |

## Macros

Office macros will need registry data to be pulled:

```bash
[WinRegMon://hkcu_policies_office]
baseline = 1
disabled = 0
hive = \\REGISTRY\\USER\\.*\\Software\\Policies\\Microsoft\\Office\\.*
index = os_win_reg
proc = .*
type = set|create|delete|rename

[WinRegMon://hkcu_software_office]
baseline = 1
disabled = 0
hive = \\REGISTRY\\USER\\.*\\Software\\Microsoft\\Office\\.*
index = os_win_reg
proc = .*
type = set|create|delete|rename
```
