# Database Connect

## Install Java

```bash
dnf install java-11-openjdk-headless
```

Configure alternatives if desired:

```bash
alternatives --config java
```

## DBX Configuration

DBX > Configuration > Settings, under installation path put "/etc/alternatives/jre_11_openjdk"

## Java Versions (LTS)

- https://www.oracle.com/java/technologies/java-se-support-roadmap.html

| Version | Released | End of Support | End of Extended Support |
| ------- | -------- | -------------- | ----------------------- |
|  8 | 2014.03 | 2022.03 | 2030.12 |
| 11 | 2018.09 | 2023.09 | 2026.09 |
| 17 | 2021.09 | 2026.09 | 2029.09 |

- Version 21 expected 2023.09
- DBX supports 8 and 11, but not 17 as of 2022.08
