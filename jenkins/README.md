# docker-jenkins
```
mkdir jenkins_home
```
```
chown 1000.1000 jenkins_home
```
```
docker-compose config
```
```
docker-compose up -d
```
```
docker-compose exec jenkins sh -c "cat /var/jenkins_home/secrets/initialAdminPassword"
```
