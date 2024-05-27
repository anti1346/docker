# predixy-redis-cluster

##### 레디스(redis-net) 네트워크 생성
```
docker network create --gateway 172.24.0.1 --subnet 172.24.0.0/16 redis-net
```

#### 레디스 정보
##### (predixy) redis info
```
redis-cli -h localhost -c -p 7617 info
```
```
$ redis-cli -h localhost -c -p 7617 info
# Proxy
Version:1.0.4
Name:PredixyExample
Bind:0.0.0.0:7617
RedisMode:proxy
SingleThread:false
WorkerThreads:4
Uptime:1672207194
UptimeSince:2022-12-28 14:59:54

# SystemResource
UsedMemory:315864
MaxMemory:0
MaxRSS:6922240
UsedCpuSys:0.582
UsedCpuUser:0.283

# Stats
Accept:4
ClientConnections:1
TotalRequests:604
TotalResponses:603
TotalRecvClientBytes:56
TotalSendServerBytes:15936
TotalRecvServerBytes:622040
TotalSendClientBytes:6916

# Servers
Server:172.24.0.11:6379
Role:master
Group:05baedca03d9e79de84cacd955fcafcca0a90343
DC:
CurrentIsFail:0
Connections:4
Connect:4
Requests:75
Responses:75
SendBytes:2004
RecvBytes:78180

Server:172.24.0.12:6379
Role:master
Group:a45d36d8d19b27aaa3b0736249f72aec601d30e4
DC:
CurrentIsFail:0
Connections:4
Connect:4
Requests:57
Responses:57
SendBytes:1500
RecvBytes:58015

Server:172.24.0.13:6379
Role:master
Group:08c71d79b8998af23a455c40003454a3157d20b4
DC:
CurrentIsFail:0
Connections:4
Connect:4
Requests:68
Responses:68
SendBytes:1808
RecvBytes:71028

Server:172.24.0.14:6379
Role:slave
Group:08c71d79b8998af23a455c40003454a3157d20b4
DC:
CurrentIsFail:0
Connections:4
Connect:4
Requests:61
Responses:61
SendBytes:1612
RecvBytes:62747

Server:172.24.0.15:6379
Role:slave
Group:05baedca03d9e79de84cacd955fcafcca0a90343
DC:
CurrentIsFail:0
Connections:4
Connect:4
Requests:67
Responses:67
SendBytes:1780
RecvBytes:69845
...
```
##### (nodes) redis cluster info
```
redis-cli -h localhost -c -p 6381 cluster info
```
```
$ redis-cli -h localhost -c -p 6381 cluster info
cluster_state:ok
cluster_slots_assigned:16384
cluster_slots_ok:16384
cluster_slots_pfail:0
cluster_slots_fail:0
cluster_known_nodes:9
cluster_size:3
cluster_current_epoch:9
cluster_my_epoch:1
cluster_stats_messages_ping_sent:3536
cluster_stats_messages_pong_sent:3499
cluster_stats_messages_sent:7035
cluster_stats_messages_ping_received:3491
cluster_stats_messages_pong_received:3536
cluster_stats_messages_meet_received:8
cluster_stats_messages_received:7035
```

##### (nodes) redis cluster nodes 
```
redis-cli -h localhost -c -p 6381 cluster nodes | sort -k2
```
```
$ redis-cli -h localhost -c -p 6381 cluster nodes | sort -k2
05baedca03d9e79de84cacd955fcafcca0a90343 172.24.0.11:6379@16379 myself,master - 0 1672207853000 1 connected 0-5460
a45d36d8d19b27aaa3b0736249f72aec601d30e4 172.24.0.12:6379@16379 master - 0 1672207854540 2 connected 5461-10922
08c71d79b8998af23a455c40003454a3157d20b4 172.24.0.13:6379@16379 master - 0 1672207854540 3 connected 10923-16383
66ea0396c35b5001c8023ee4e536c574c16395e5 172.24.0.14:6379@16379 slave 08c71d79b8998af23a455c40003454a3157d20b4 0 1672207854540 3 connected
29f11d425109396a20c16fa40131851e26afa304 172.24.0.15:6379@16379 slave 05baedca03d9e79de84cacd955fcafcca0a90343 0 1672207854000 1 connected
58f7c03178884392a6b34856355eb508fe2a96c0 172.24.0.16:6379@16379 slave 05baedca03d9e79de84cacd955fcafcca0a90343 0 1672207854000 1 connected
c59b5df3324953d2d8acba388f793ead4fa8611f 172.24.0.17:6379@16379 slave a45d36d8d19b27aaa3b0736249f72aec601d30e4 0 1672207854540 2 connected
81f2b8601af8d2e32a74ba4bc439b5c11ca98a84 172.24.0.18:6379@16379 slave a45d36d8d19b27aaa3b0736249f72aec601d30e4 0 1672207854238 2 connected
146d1a5146fa61c583f4b384d1e53b155ceb48f3 172.24.0.19:6379@16379 slave 08c71d79b8998af23a455c40003454a3157d20b4 0 1672207853535 3 connected
```
```
$ redis-cli -h localhost -c -p 6381 cluster nodes | sort -k7
29f11d425109396a20c16fa40131851e26afa304 172.24.0.15:6379@16379 slave 05baedca03d9e79de84cacd955fcafcca0a90343 0 1672208407569 1 connected
58f7c03178884392a6b34856355eb508fe2a96c0 172.24.0.16:6379@16379 slave 05baedca03d9e79de84cacd955fcafcca0a90343 0 1672208407569 1 connected
05baedca03d9e79de84cacd955fcafcca0a90343 172.24.0.11:6379@16379 myself,master - 0 1672208406000 1 connected 0-5460
81f2b8601af8d2e32a74ba4bc439b5c11ca98a84 172.24.0.18:6379@16379 slave a45d36d8d19b27aaa3b0736249f72aec601d30e4 0 1672208407569 2 connected
c59b5df3324953d2d8acba388f793ead4fa8611f 172.24.0.17:6379@16379 slave a45d36d8d19b27aaa3b0736249f72aec601d30e4 0 1672208407000 2 connected
a45d36d8d19b27aaa3b0736249f72aec601d30e4 172.24.0.12:6379@16379 master - 0 1672208407000 2 connected 5461-10922
146d1a5146fa61c583f4b384d1e53b155ceb48f3 172.24.0.19:6379@16379 slave 08c71d79b8998af23a455c40003454a3157d20b4 0 1672208407000 3 connected
66ea0396c35b5001c8023ee4e536c574c16395e5 172.24.0.14:6379@16379 slave 08c71d79b8998af23a455c40003454a3157d20b4 0 1672208407000 3 connected
08c71d79b8998af23a455c40003454a3157d20b4 172.24.0.13:6379@16379 master - 0 1672208407569 3 connected 10923-16383
```

#### 레디스 데이터 입출력(predixy 7616)
```
redis-cli -c -h 127.0.0.1 -p 7617 set hello world
```
```
redis-cli -c -h 127.0.0.1 -p 7617 get hello
```
```
$ redis-cli -h localhost -c -p 6381
localhost:6381> get hello
"world"
localhost:6381> quit
```
```
$ redis-cli -h localhost -c -p 6382
localhost:6382> get hello
-> Redirected to slot [866] located at 172.24.0.11:6379
"world"
172.24.0.11:6379>
```

###### 레디스 서버(컨테이너)로 데이타 입출력
```
docker exec -it node1 redis-cli -c get hello
```

###### git push
```
git add .
git commit -m "first commit"
git push -u origin main
```
