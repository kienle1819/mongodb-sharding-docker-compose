# mongodb-sharding-docker-compose

:whale: docker-compose stack that allows you to turn on a full MongoDB sharded cluster with the following components :

 * configserver replicaset: 3x mongod with configsrv enabled 
 * first replicaset shard: 3x mongod 
 * second replicaset shard: 3x mongod
 * third replicaset shard: 3x mongod
 * mongo query router: 1x mongos
 * authentication enabled + global auth key certificate between nodes

:warning: Of course this is for development purpose only  

    # Usage :
    $ https://github.com/kienle1819/mongodb-sharding-docker-compose.git
    $ mongodb-sharding-docker-compose
    $ ./up.sh
    
    
You can also edit mongo-auth.init.js to change admin credentials before turning up the cluster

    admin = db.getSiblingDB("admin")
    admin.createUser(
      {
         user: "admin",
         pwd: "admin",
         roles: [ { role: "userAdminAnyDatabase", db: "admin" } ] 
      }
    )

:tropical_drink: Then you should be able to log into the cluster:

    $ docker exec -it mongo-router-01 mongo admin  -u 'admin' -p 'admin'
   Current Mongosh Log ID: 65479c1b35d5d3fc69aeb6e9
   Connecting to:          mongodb://<credentials>@127.0.0.1:30000/?directConnection=true&serverSelectionTimeoutMS=2000&authSource=admin&appName=mongosh+2.0.1
   Using MongoDB:          7.0.2
   Using Mongosh:          2.0.1

   For mongosh info see: https://docs.mongodb.com/mongodb-shell/

  [direct: mongos] test>
    
  
:beer: And turn it down with:

    $ ./down.sh
    
    
   # TODO :construction:
   
  * Generate random data to populate shards through balancing 
  * Update compose syntax to v3 
  * Use swarm capabilities for production grade deployment 
  