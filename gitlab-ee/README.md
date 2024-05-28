# docker-gitlab-ee
### Let's Encrypt(Certbot)
```
sudo apt-get update
```
```
sudo apt-get install -y certbot
```
```
sudo certbot certonly --standalone --agree-tos --email email@example.com -d gitlab.example.com
```
```
sudo certbot certificates
```
```
sudo openssl x509 -in /etc/letsencrypt/live/gitlab.example.com/cert.pem -text -noout
```
## Docker GitLab Enterprise Edition(EE)
```
mkdir -p gitlab
```
```
sudo chown -R 999:999 gitlab
```
```
sudo chmod -R 755 gitlab
```
```
vim docker-compose.yml
```
```
docker compose config
```
```
docker compose up -d
```
```
docker compose ps
```
```
docker compose exec gitlab gitlab-ctl status
```
```
docker compose exec gitlab grep 'Password:' /etc/gitlab/initial_root_password
```
```
docker compose logs -f
```
##### 웹 브라우저
```
root / Password
```
```
docker compose down -v
```
