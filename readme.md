# lsof

Find out listening port by process command name:

```
lsof -i -n -P -a -c gameoflife -F | grep 'n*:' | sed 's/n\*\://'
```

# CURL

Check Gzip effect.

```
curl http://127.0.0.1:8080/css/app.css --silent -H "Accept-Encoding: gzip,deflate" --write-out "%{size_download}\n" --output /dev/null
```