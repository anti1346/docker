# vault-test(HashiCorp Vault)
### SSH 서버와 Vault를 연동하고 구성하는 방법



##### SSH 키 생성: ssh 디렉토리를 생성하고 SSH 키를 생성합니다.
```
mkdir ssh
```
```
ssh-keygen -f ssh/id_rsa -N ''
```

##### 컨테이너 실행: Docker Compose로 컨테이너를 실행합니다.
```
docker-compose up -d
```

##### 테스트
```
apk add curl
```
```
curl http://localhost:8200/v1/sys/init
```
