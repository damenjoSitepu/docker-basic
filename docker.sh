# Seeing Docker Image List
docker image ls
# Installing Docker Image With Redis 
docker image pull redis:latest
# Removing Docker Image With Redis
docker image rm redis:latest
# Showing All Container (Running / Created)
docker container ls -a
# Creating Container With Redis Image
docker container create --name redisexample redis:latest
# Running Container 
docker container start redisexample
# Stop Container
docker container stop redisexample
# Remove Container
docker container rm redisexample2
# Showing Container Logs
docker container logs redisexample
# Showing Container Logs Realtime
docker container logs -f redisexample
# Using Container Exec To Access The Container
docker container exec -i -t redisexample /bin/bash
# Creating Container With Port Forwarding
docker container create --name redisexample --publish 8020:6379 redis:latest
# Create Container With Mongo Image Also With Environment
docker container create --name mongoexample --publish 27000:27017 --env MONGO_INITDB_ROOT_USERNAME=damenjo --env MONGO_INITDB_ROOT_PASSWORD=sitepu mongo:latest
# Check Every Container Memory Usage And Their Details
docker container stats
# Creating container with resources limitation
docker container create --name mongoexample --publish 27000:27017 --memory 200M --cpus 1 --env MONGO_INITDB_ROOT_USERNAME=damenjo --env MONGO_INITDB_ROOT_PASSWORD=sitepu mongo:latest
# Creating container with bind mount 
docker container create --name mongoexample --publish 27000:27017 --mount "type=bind,source=/Users/a123/Documents/learn/docker-basic/data,destination=/data/db" --memory 200M --cpus 1 --env MONGO_INITDB_ROOT_USERNAME=damenjo --env MONGO_INITDB_ROOT_PASSWORD=sitepu mongo:latest
# Showing Volumes
docker volume ls
# Creating Volume
docker volume create mongoexamplevolume
# Deleting Volume
docker volume rm mongoexamplevolume
# Creating container with volume 
docker container create --name mongoexample --publish 27000:27017 --mount "type=volume,source=mongo1volume,destination=/data/db" --memory 200M --cpus 1 --env MONGO_INITDB_ROOT_USERNAME=damenjo --env MONGO_INITDB_ROOT_PASSWORD=sitepu mongo:latest
# Seeing Network
docker network ls
# Creating Network
docker network create --driver bridge customnetwork
# Deleting Network (Please delete all connected container to the network before perform deletion)
docker network rm customnetwork

# Inspect Detail Information From Network, Image, Container, Volume
docker network inspect ultimatenetwork

# Removing Unused Network, Container, Or Image, And Cache
docker system prune
# One Only
docker volume prune
docker container prune
docker image prune
docker network prune