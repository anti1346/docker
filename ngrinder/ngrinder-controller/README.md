# ngrinder controller
#### ngrinder controller 실행
```
docker-compose up -d
```
#### ngrinder 웹 페이지 접속
```
http://serverip:8888
ID/PW : admin / admin
```
#### ngrinder-controller 디렉토리를 로컬 디스크로 복사(컨테이너 안에 있는 파일을 로컬디스크 복사)
```
docker run -d --name controller ngrinder/controller
```
```
docker cp controller:/opt/ngrinder-controller .
```
```
docker rm -f controller
```
