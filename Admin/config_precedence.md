# Config Precedence

- https://docs.splunk.com/Documentation/Splunk/latest/Admin/Wheretofindtheconfigurationfiles

```bash
# egrep "conf$" /opt/splunk/etc/system/default/conf.conf
$users-base$/$user-restriction$/*/local                = conf
$users-base$/$user-restriction$/*/default              = conf
$users-base$/_reserved/*/*/local                       = conf
$users-base$/_reserved/*/*/default                     = conf
$apps-slave$/*/local                                   = conf
system/local                                           = conf
$apps-base$/*/local                                    = conf
$apps-base$/learned/local                              = conf
$apps-slave$/*/default                                 = conf
$apps-base$/*/default                                  = conf
system/default                                         = conf
$apps-base$/learned/default                            = conf
```
