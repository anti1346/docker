# graylog-docker

### docker install 
```
curl -fsSL https://get.docker.com -o get-docker.sh;
chmod +x  get-docker.sh;
sh get-docker.sh;
usermod -a -G docker $USER;
docker version;
```


### docker-compose install
[DOCKER-COMPOSE](https://github.com/docker/compose/releases)
```
curl -fsSL https://github.com/docker/compose/releases/download/1.25.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose;
chmod +x /usr/local/bin/docker-compose;
docker-compose version;
```


### ctop install
[CTOP](https://github.com/bcicen/ctop)
```
curl -fsSL https://github.com/bcicen/ctop/releases/download/v0.7.3/ctop-0.7.3-linux-amd64 -O /usr/local/bin/ctop;
chmod +x /usr/local/bin/ctop;
ctop -v
```


## graylog install
```
mkdir -p {mongo_data,es_data,graylog_data}
chown -R 999.999 mongo_data
chown -R 1000.1000 es_data
chown -R 1100.1100 graylog_data
```

#### syslog client test
```
nc -u 192.168.100.18 8514
tcpdump -vv -n -i enp0s3 port 8514
```

#### syslog setting
```
vim /etc/rsyslog.d/90-graylog2.conf
*.* @192.168.100.17:8514;RSYSLOG_SyslogProtocol23Format

systemctl restart rsyslog
```
