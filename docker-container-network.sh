# Creating Network
docker network create ultimatenetwork
# Seeing The Network
docker network ls
# Creating The Container For MongoDB Associate With Network
docker container create --name mongonetwork --network ultimatenetwork --env MONGO_INITDB_ROOT_USERNAME=damenjo --env MONGO_INITDB_ROOT_PASSWORD=sitepu mongo:latest
# Pull Mongo Express Image
docker image pull mongo-express:latest
# Seeing The Image
docker image ls
# Creating The Container For Mongo Express With Network
docker container create --name mongoexpress --publish 8020:8081 --network ultimatenetwork --env ME_CONFIG_MONGODB_ADMINUSERNAME=damenjo --env ME_CONFIG_MONGODB_ADMINPASSWORD=sitepu --env ME_CONFIG_BASICAUTH=false --env ME_CONFIG_MONGODB_URL="mongodb://damenjo:sitepu@mongonetwork:27017/" mongo-express:latest

# Disconnecting A Container From Network
docker network disconnect ultimatenetwork mongonetwork
# Connecting A Container To Network
docker network connect ultimatenetwork mongonetwork