# Docker Container Monitoring 
#### Create Directory 
```
mkdir -p /docker-container/docker-container-monitoring/promtail
```
```
cd /docker-container/docker-container-monitoring
```
```
echo "hostname=$(hostname)" > .env
```
```
version: '3.8'
services:
  $(hostname)-cadvisor:
    image: gcr.io/cadvisor/cadvisor:v0.49.1
    container_name: $(hostname)-cadvisor
    restart: unless-stopped
    privileged: true
    volumes:
      - /:/rootfs:ro
      - /var/run:/var/run:ro
      - /sys:/sys:ro
      - /var/lib/docker/:/var/lib/docker:ro
      - /dev/disk/:/dev/disk:ro
      - /dev/kmsg:/dev/kmsg
    ports:
      - 8080:8080
    networks:
      - mo-net

  $(hostname)-promtail:
    image: grafana/promtail:2.9.1
    container_name: $(hostname)-promtail
    restart: unless-stopped
    environment:
      - LOKI_SERVER=${LOKI_SERVER}
    command: --config.file=/etc/promtail/config.yaml
    volumes:
      - /var/log:/var/log:ro
      - /var/lib/docker/containers:/var/lib/docker/containers:ro
      - ./promtail/config.yaml:/etc/promtail/config.yaml
    ports:
      - 9080:9080
    networks:
      - mo-net

networks:
  mo-net:
    - name: mo-net
```
```
cat <<'EOF' > promtail/config.yaml
server:
  http_listen_address: 0.0.0.0
  http_listen_port: 9080
  grpc_listen_port: 0

positions:
  filename: /tmp/positions.yaml

clients:
  - url: http://${LOKI_SERVER}:3100/loki/api/v1/push

scrape_configs:
- job_name: system
  static_configs:
  - targets:
      - localhost
    labels:
      job: varlogs
      __path__: /var/log/*log

- job_name: containers
  static_configs:
  - targets:
      - localhost
    labels:
      job: containerlogs
      cluster: multipass-cluster
      __path__: /var/lib/docker/containers/*/*log

  pipeline_stages:
  - json:
      expressions:
        stream: stream
        attrs: attrs
        tag: attrs.tag
  - regex:
      expression: (?P<container_name>(?:[^|]*[^|]))
      source: "tag"
  - labels:
      stream:
      container_name:
EOF
```
```
docker compose up -d
```

<details>
<summary>접기/펼치기</summary>

### cadvisor
#### Create Directory 
```
mkdir -p /docker-container/docker-cadvisor
```
```
cd /docker-container/docker-cadvisor
```
```
cat <<EOF > docker-compose.yml
version: '3.8'
services:
  $(hostname)-cadvisor:
    image: gcr.io/cadvisor/cadvisor:v0.49.1
    container_name: $(hostname)-cadvisor
    restart: unless-stopped
    privileged: true
    volumes:
      - /:/rootfs:ro
      - /var/run:/var/run:ro
      - /sys:/sys:ro
      - /var/lib/docker/:/var/lib/docker:ro
      - /dev/disk/:/dev/disk:ro
      - /dev/kmsg:/dev/kmsg
    ports:
      - 8080:8080
EOF
```
```
docker compose up -d
```

### promtail
#### Create Directory 
```
mkdir -p /docker-container/docker-promtail/promtail
```
```
cd /docker-container/docker-promtail
```
```
cat <<EOF > docker-compose.yml
version: '3.8'
services:
  $(hostname)-promtail:
    image: grafana/promtail:2.9.1
    container_name: $(hostname)-promtail
    restart: unless-stopped
    environment:
      - LOKI_SERVER=192.168.0.111
    command: --config.file=/etc/promtail/config.yaml
    volumes:
      - /var/log:/var/log:ro
      - /var/lib/docker/containers:/var/lib/docker/containers:ro
      - ./promtail/config.yaml:/etc/promtail/config.yaml
    ports:
      - 9080:9080
EOF
```
```
cat <<'EOF' > promtail/config.yaml
server:
  http_listen_address: 0.0.0.0
  http_listen_port: 9080
  grpc_listen_port: 0

positions:
  filename: /tmp/positions.yaml

clients:
  - url: http://${LOKI_SERVER}:3100/loki/api/v1/push

scrape_configs:
- job_name: system
  static_configs:
  - targets:
      - localhost
    labels:
      job: varlogs
      __path__: /var/log/*log

- job_name: containers
  static_configs:
  - targets:
      - localhost
    labels:
      job: containerlogs
      cluster: multipass-cluster
      __path__: /var/lib/docker/containers/*/*log

  pipeline_stages:
  - json:
      expressions:
        stream: stream
        attrs: attrs
        tag: attrs.tag
  - regex:
      expression: (?P<container_name>(?:[^|]*[^|]))
      source: "tag"
  - labels:
      stream:
      container_name:
EOF
```
```
docker compose up -d
```

</details>
