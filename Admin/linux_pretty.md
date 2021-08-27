# Linux made Pretty

## .vimrc

```bash
syntax enable
colorscheme elflord
```

## .bashrc

```bash
# Coloured prompt
PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h\[\033[1;31m\]:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '
```

## .screenrc

```bash
startup_message off
shelltitle :)
hardstatus alwayslastline
hardstatus string "%{+b Rk}[ %{-b g}$LOGNAME@%H %{+b R}] %{-b g}%-w%{y}%n %t%{-}%+w %-19=%{+b R}[ %{-b g}%c %d.%m.%y %{+b R}]"
# Funky yellow
#hardstatus string "%{= ky}%-Lw%{=r}%20>%n %t%{= ky}%+Lw %{= ky}%-=| %{= kw}%M%d %c%{-} %{=r} ${USER}@%H "
```

## MOTD

```bash
                            \\\|///
                           \\ ~ ~ //
                            ( @ @ )
/------------------------oOOo-(_)-oOOo------------------------\
|                                                             |
|  Unauthorised access to this system is forbidden. GO AWAY!  |
|                                                             |
\------------------------Oooo.---.oooO------------------------/
                         (   )   (   )
                          \ (     ) /
                           \_)   (_/
```
