rs.initiate(
    {
       _id: "configserver",
       configsvr: true,
       version: 1,
       members: [
          { _id: 0, host : "mongodb-201:27018" },
          { _id: 1, host : "mongodb-201:27018" },
          { _id: 2, host : "mongodb-201:27018" }
       ]
    }
 )