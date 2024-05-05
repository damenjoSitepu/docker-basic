# Creating Volume
docker volume create mongo1volume
# Seeing Volume
docker volume ls
# Creating Container
docker container create --name mongo1 --publish 27005:27017 --mount "type=volume,source=mongo1volume,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=damenjo --env MONGO_INITDB_ROOT_PASSWORD=tari mongo:latest 

# Backup Flow ---

# Stop The Container
docker container stop mongo1
# Backup The Volume From Mongo1 Container (Dont Forget To Stop The Container First)
docker container run --rm --name mongo1backup --mount "type=bind,source=/Users/a123/Documents/learn/docker-basic/mongo-1-backup,destination=/mongo-1-backup" --mount "type=volume,source=mongo1volume,destination=/mongo-1-data" redis:latest bash -c "tar -zcvf /mongo-1-backup/mongo-1-backup-data.tar.gz /mongo-1-data && exit"

# Restoration Flow ---

# Create The New Volum
docker volume create mongo2volume
# Create The New Temporary Container With Backup Volume
docker container run --rm --name mongo2backup --mount "type=bind,source=/Users/a123/Documents/learn/docker-basic/mongo-1-backup,destination=/mongo-2-backup" --mount "type=volume,source=mongo2volume,destination=/mongo-2-data" redis:latest bash -c "cd /mongo-2-data && tar xvf /mongo-2-backup/mongo-1-backup-data.tar.gz --strip 1 && exit"
# Create The New Container
docker container create --name mongo2 --publish 27010:27017 --memory 300M --cpus 1 --mount "type=volume,source=mongo2volume,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=damenjo --env MONGO_INITDB_ROOT_PASSWORD=tari mongo:latest