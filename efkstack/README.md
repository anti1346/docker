## elasticsearch cluster setting 
### elasticsearch data directory create
```
mkdir esdata; chown -R 1000.1000 esdata
```
### kibana data directory create
```
mkdir -p kibana/data; chown -R 1000.1000 kibana/data
```
### fluentd log directory create
```
mkdir -p fluentd/log; chown -R 999.999 fluentd/log
```
### cert rsync
```
rsync -avz -e ssh /docker-container/docker-efkstack/certs root@es02:/docker-container/docker-efkstack/
 
rsync -avz -e ssh /docker-container/docker-efkstack/certs root@es03:/docker-container/docker-efkstack/
```
## elasticsearch API
### elasticsearch default
```
curl -s -XGET "https://localhost:9200" -u "elastic:elastic1!" --cacert ../certs/ca/ca.crt
```
### cluster health
```
curl -s -XGET "https://localhost:9200/_cluster/health?pretty" -u "elastic:elastic1!" --cacert ../certs/ca/ca.crt
```
### nodes info
```
curl -s -XGET "https://localhost:9200/_cat/nodes?v&pretty" -u "elastic:elastic1!" --cacert ../certs/ca/ca.crt
```
```
curl -s -XGET "https://localhost:9200/_cat/nodes?v&pretty" -u "kibana_system:elastic1!" --cacert ../certs/ca/ca.crt
```
### indices
```
curl -s -XGET "https://localhost:9200/_cat/indices?v" -u "elastic:elastic1!" --cacert ../certs/ca/ca.crt
```
## fluent API
### fluent default
```
curl -XPOST -d 'json={"json":"message"}' http://localhost:8888/debug.test
```