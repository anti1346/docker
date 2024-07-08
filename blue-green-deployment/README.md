# Blue/Green Deployment


#### nginx switch
##### Nginx의 백엔드를 green으로 전환
```
docker exec -it nginx sh -c "/apps/switch.sh green"
```
##### blue-app 서비스를 중지
```
docker compose stop blue-app
```
##### Nginx의 설정을 다시 blue 버전으로 전환
```
docker exec -it nginx sh -c "/apps/switch.sh blue"
```
#### 모든 서비스를 실행
```
docker compose up -d
```

<details>
<summary>접기/펼치기 버튼</summary>

### Docker(Dockerfile, Container, Compose)

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
</details>