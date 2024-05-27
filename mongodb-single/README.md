# docker-mongodb
docker mongodb
```
docker-compose exec mongo1 bash
```
```
mongo -uroot -pchangeme
```
```
rs.initiate(
   {
      _id: "rs1",
      members: [
         { _id: 0, host : "mongo1:27017" }
      ]
   }
)
```
