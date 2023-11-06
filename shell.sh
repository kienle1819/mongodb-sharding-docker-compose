#!/bin/bash

docker exec -it mongo-router-01 mongosh -u 'admin' -p 'admin@123' --authenticationDatabase=admin localhost:20001/$1 $2 $3