# lsof

Find out listening port by process command name:

```
lsof -i -n -P -a -c gameoflife -F | grep 'n*:' | sed 's/n\*\://'
```