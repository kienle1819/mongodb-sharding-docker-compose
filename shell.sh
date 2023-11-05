#!/bin/bash

docker exec -it mongodbdocker-mongo-router-01-1 mongosh -u 'admin' -p 'admin' --authenticationDatabase=admin localhost:27017/$1 $2 $3