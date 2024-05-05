# Manual BackUp (1)

# Create Container Backup With Any Image
docker container create --name mongobackup --memory 50M --cpus 1 --mount "type=bind,source=/Users/a123/Documents/learn/docker-basic/mongo-backup,destination=/mongo-backup" --mount "type=volume,source=mongovolumeexample,destination=/mongo-data" mongo:latest

# Compress Folder To Zip using Tar
tar -zcvf file.tar.gz /path/to/dir/

# Using Run Container (2)

# Create Container Backup With Any Image
docker container run --rm --name mongobackup --memory 50M --cpus 1 --mount "type=bind,source=/Users/a123/Documents/learn/docker-basic/mongo-backup,destination=/mongo-backup" --mount "type=volume,source=mongovolumeexample,destination=/mongo-data" redis:latest tar -zcvf /mongo-backup/mongo-backup-from-container-run.tar.gz /mongo-data && exit