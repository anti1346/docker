docker build -t haproxy:2.0.5 .

docker run -it --net=host --name myhaproxy -d haproxy:2.0.5
