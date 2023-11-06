#!/bin/bash

## Composer project name instead of git main folder name
export COMPOSE_PROJECT_NAME=mongodbdocker

## Generate global auth key between cluster nodes
openssl rand -base64 756 > mongodb.key
chmod 600 mongodb.key
mkdir data > /dev/null 2>&1

## Start the whole stack
docker-compose up -d 
sleep 60
echo seed the config server
## Config servers setup
docker exec -it mongo-configserver-a sh -c "/usr/bin/mongosh --port 27017 < /mongo-configserver.init.js"

## Shard servers setup
docker exec -it mongo-shard-01a sh -c "/usr/bin/mongosh --port 27017 < /mongo-shardrs-01.init.js" 

## Apply sharding configuration
sleep 15
echo configure router sharding
docker exec -it mongo-router-01 sh -c "/usr/bin/mongosh --port 27017 < /mongo-sharding.init.js"

## Enable admin account
echo auth init
docker exec -it mongo-router-01 sh -c "/usr/bin/mongosh --port 27017 < /mongo-auth.init.js"
