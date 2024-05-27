#!/bin/bash

docker-compose exec mongo1 mongosh -u root -p changeme mongodb://mongodb-201:27011 << EOF
rs.initiate(
    {
        _id: 'rs',
        members: [
            {_id: 0, host: "mongodb-201:27011"},
            {_id: 1, host: "mongodb-202:27011"},
            {_id: 2, host: "mongodb-203:27011"},
            {_id: 3, host: "mongodb-201:27012"},
            {_id: 4, host: "mongodb-202:27012"},
            {_id: 5, host: "mongodb-203:27012"},
            {_id: 6, host: "mongodb-203:27013"},
        ]
    }
);
EOF