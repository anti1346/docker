### docker build
```
docker build --no-cache -t anti1346/nginx:1.21.6 .
```

### docker buildx(m1)
```
docker buildx build --platform linux/amd64 --load --no-cache -t anti1346/nginx:1.21.6-amd64 .
```
