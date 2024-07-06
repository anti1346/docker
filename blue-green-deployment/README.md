# Blue/Green Deployment

Docker(Dockerfile, Container, Compose)

##### nginx docker build
```
cd nginx
```
```
docker build --tag anti1346/ngin:blue-green --no-cache .
```
```
docker push anti1346/ngin:blue-green
```

##### jar docker build

```
docker build --tag anti1346/demo:blue-green --no-cache .
```


##### nginx switch
```
docker exec -it nginx sh -c "/apps/switch.sh green"
```
```
docker exec -it nginx sh -c "/apps/switch.sh blue"
```

