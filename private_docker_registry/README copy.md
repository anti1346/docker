# Private Docker Registry (Docker Hub)

#### HTTP Authorization
```
sudo apt-get install -y apache2-utils
```
```
sudo mkdir -p registry/auth
```
##### testuser / testpassword
```
htpasswd -Bbn testuser testpassword > registry/auth/htpasswd
```

```
docker login --username testuser http://registry.sangchul.kr
```
```
docker tag nginx:latest registry.sangchul.kr/nginx:latest
```

```
docker push registry.sangchul.kr/nginx:latest
```
```
docker tag ubuntu:latest registry.sangchul.kr/ubuntu:latest
```
```
docker push registry.sangchul.kr/ubuntu:latest
```

```
docker pull registry.sangchul.kr/nginx:latest
```
