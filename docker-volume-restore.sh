# Restoring Container From Certain Restored Volume
docker container run --rm --name mongorestore --memory 50M --cpus 1 --mount "type=bind,source=/Users/a123/Documents/learn/docker-basic/mongo-backup,destination=/mongo-backup" --mount "type=volume,source=mongovolumeexample,destination=/mongo-data" redis:latest bash -c "cd /mongo-data && tar xvf /mongo-backup/mongo-backup.tar.gz --strip 1 && exit"

# Create New Container
docker container create --name mongotest --publish 27001:27017 --memory 200M --cpus 1 --mount "type=volume,source=mongorestoreexample,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=damenjo --env MONGO_INITDB_ROOT_PASSWORD=sitepu mongo:latest