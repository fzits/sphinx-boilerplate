# Sphinx Boilerplate

```
docker build . -t sphinx
```

```
mkdir doc
docker run --rm -it -p 127.0.0.1:8080:8080 -v ${PWD}/doc:/sphinx sphinx
```
