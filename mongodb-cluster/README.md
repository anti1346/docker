# docker-mongodb-cluster

#### docker-compose up
```
$ docker-compose up -d
Creating mongo3 ... done
Creating mongo1 ... done
Creating mongo2 ... done
```
#### docker-compose ps
```
$ docker-compose ps
 Name               Command                  State                          Ports
-----------------------------------------------------------------------------------------------------
mongo1   docker-entrypoint.sh mongo ...   Up (healthy)   0.0.0.0:30001->27017/tcp,:::30001->27017/tcp
mongo2   docker-entrypoint.sh mongo ...   Up             0.0.0.0:30002->27017/tcp,:::30002->27017/tcp
mongo3   docker-entrypoint.sh mongo ...   Up             0.0.0.0:30003->27017/tcp,:::30003->27017/tcp
```
#### mongodb cluster setup
```
$ docker-compose exec mongo1 mongo
---
>

> rsconf = {
   _id : "replica-set",
   members: [
       {
           "_id": 0,
           "host": "mongo1:27017",
           "priority": 4
       },
       {
           "_id": 1,
           "host": "mongo2:27017",
           "priority": 2
       },
       {
           "_id": 2,
           "host": "mongo3:27017",
           "priority": 1
       }
   ]
}

> rs.initiate(rsconf);
```
#### mongodb cluster status
```
replica-set:PRIMARY> rs.status()
{
	"set" : "replica-set",
	"date" : ISODate("2021-07-12T14:44:44.760Z"),
	"myState" : 1,
	"term" : NumberLong(1),
	"syncSourceHost" : "",
	"syncSourceId" : -1,
	"heartbeatIntervalMillis" : NumberLong(2000),
	"majorityVoteCount" : 2,
	"writeMajorityCount" : 2,
	"votingMembersCount" : 3,
	"writableVotingMembersCount" : 3,
	"optimes" : {
		"lastCommittedOpTime" : {
			"ts" : Timestamp(1626101077, 1),
			"t" : NumberLong(1)
		},
		"lastCommittedWallTime" : ISODate("2021-07-12T14:44:37.101Z"),
		"readConcernMajorityOpTime" : {
			"ts" : Timestamp(1626101077, 1),
			"t" : NumberLong(1)
		},
		"readConcernMajorityWallTime" : ISODate("2021-07-12T14:44:37.101Z"),
		"appliedOpTime" : {
			"ts" : Timestamp(1626101077, 1),
			"t" : NumberLong(1)
		},
		"durableOpTime" : {
			"ts" : Timestamp(1626101077, 1),
			"t" : NumberLong(1)
		},
		"lastAppliedWallTime" : ISODate("2021-07-12T14:44:37.101Z"),
		"lastDurableWallTime" : ISODate("2021-07-12T14:44:37.101Z")
	},
	"lastStableRecoveryTimestamp" : Timestamp(1626101047, 3),
	"electionCandidateMetrics" : {
		"lastElectionReason" : "electionTimeout",
		"lastElectionDate" : ISODate("2021-07-12T14:44:07.077Z"),
		"electionTerm" : NumberLong(1),
		"lastCommittedOpTimeAtElection" : {
			"ts" : Timestamp(0, 0),
			"t" : NumberLong(-1)
		},
		"lastSeenOpTimeAtElection" : {
			"ts" : Timestamp(1626101036, 1),
			"t" : NumberLong(-1)
		},
		"numVotesNeeded" : 2,
		"priorityAtElection" : 4,
		"electionTimeoutMillis" : NumberLong(10000),
		"numCatchUpOps" : NumberLong(0),
		"newTermStartDate" : ISODate("2021-07-12T14:44:07.086Z"),
		"wMajorityWriteAvailabilityDate" : ISODate("2021-07-12T14:44:07.884Z")
	},
	"members" : [
		{
			"_id" : 0,
			"name" : "mongo1:27017",
			"health" : 1,
			"state" : 1,
			"stateStr" : "PRIMARY",
			"uptime" : 261,
			"optime" : {
				"ts" : Timestamp(1626101077, 1),
				"t" : NumberLong(1)
			},
			"optimeDate" : ISODate("2021-07-12T14:44:37Z"),
			"syncSourceHost" : "",
			"syncSourceId" : -1,
			"infoMessage" : "",
			"electionTime" : Timestamp(1626101047, 1),
			"electionDate" : ISODate("2021-07-12T14:44:07Z"),
			"configVersion" : 1,
			"configTerm" : 1,
			"self" : true,
			"lastHeartbeatMessage" : ""
		},
		{
			"_id" : 1,
			"name" : "mongo2:27017",
			"health" : 1,
			"state" : 2,
			"stateStr" : "SECONDARY",
			"uptime" : 48,
			"optime" : {
				"ts" : Timestamp(1626101077, 1),
				"t" : NumberLong(1)
			},
			"optimeDurable" : {
				"ts" : Timestamp(1626101077, 1),
				"t" : NumberLong(1)
			},
			"optimeDate" : ISODate("2021-07-12T14:44:37Z"),
			"optimeDurableDate" : ISODate("2021-07-12T14:44:37Z"),
			"lastHeartbeat" : ISODate("2021-07-12T14:44:43.084Z"),
			"lastHeartbeatRecv" : ISODate("2021-07-12T14:44:44.093Z"),
			"pingMs" : NumberLong(0),
			"lastHeartbeatMessage" : "",
			"syncSourceHost" : "mongo1:27017",
			"syncSourceId" : 0,
			"infoMessage" : "",
			"configVersion" : 1,
			"configTerm" : 1
		},
		{
			"_id" : 2,
			"name" : "mongo3:27017",
			"health" : 1,
			"state" : 2,
			"stateStr" : "SECONDARY",
			"uptime" : 48,
			"optime" : {
				"ts" : Timestamp(1626101077, 1),
				"t" : NumberLong(1)
			},
			"optimeDurable" : {
				"ts" : Timestamp(1626101077, 1),
				"t" : NumberLong(1)
			},
			"optimeDate" : ISODate("2021-07-12T14:44:37Z"),
			"optimeDurableDate" : ISODate("2021-07-12T14:44:37Z"),
			"lastHeartbeat" : ISODate("2021-07-12T14:44:43.085Z"),
			"lastHeartbeatRecv" : ISODate("2021-07-12T14:44:44.088Z"),
			"pingMs" : NumberLong(0),
			"lastHeartbeatMessage" : "",
			"syncSourceHost" : "mongo1:27017",
			"syncSourceId" : 0,
			"infoMessage" : "",
			"configVersion" : 1,
			"configTerm" : 1
		}
	],
	"ok" : 1,
	"$clusterTime" : {
		"clusterTime" : Timestamp(1626101077, 1),
		"signature" : {
			"hash" : BinData(0,"AAAAAAAAAAAAAAAAAAAAAAAAAAA="),
			"keyId" : NumberLong(0)
		}
	},
	"operationTime" : Timestamp(1626101077, 1)
}
```

#### git push
```
git add .
git commit -m "first commit"
git branch -M main
git push -u origin main
```
