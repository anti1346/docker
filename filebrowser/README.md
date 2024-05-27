# File Browser
#### File Browser URL
```
https://filebrowser.xyz/installation#docker
```
```
https://filebrowser.xyz/
```
#### File Browser Username/Password
```
Username: admin
Password: admin
```
#### Scanner file : Delete files 3 days ago
```
crontab -l
```
```
  01 01 * * *	/app/filebrowser/file_delete.sh > /dev/null 2>&1
```

## filebrowser, simple-file-upload-download-server Collaboration
#### data 디렉토리 생성(docker compose 디렉토리)
```
mkdir -p data
```
#### 도커 컴파일 시작
```
docker compose up -d
```
#### filebrowser 브라우저
```
http://localhost:8080
```
#### curl POST 파일 업로드
```
curl -F file=@testfile.txt http://localhost:3000
```
#### curl GET 파일 다운로드
```
curl -fsSL http://localhost:3000/file?file=testfile.txt -o testfile.txt
```
