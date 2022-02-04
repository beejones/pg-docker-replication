# pg-docker-replication
Create a docker setup with multiple servers which replicate

In vscode it is advisable to install the Microsoft Docker extension: ms-azuretools.vscode-docker


# Create a single postgres container

Install the postgres client, run the container and connect the client.

```bash
sudo apt install postgresql-client -y
docker-compose -f docker/single-pg.yaml up
PGPASSWORD=postgres psql -U postgres -h 0.0.0.0
```

Stopping the container
```bash
docker-compose -f docker/single-pg.yaml down
```
# Create primary and standby containers

Based on https://hub.docker.com/r/bitnami/postgresql

Prepare volumes

```
mkdir -p primary
mkdir -p primary/data
mkdir -p primary/conf
sudo chown 999:999 primary
sudo chown 999:999 primary/data/
sudo chown 999:999 primary/conf/

Start containers
```
cd docker
docker-compose up  --scale postgresql-primary=1 --scale postgresql-replica=1
```

Stop containers
```
docker-compose down
```


Inspect IP Address of standby and primary
```
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' docker_postgresql-replica_1
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' docker_postgresql-primary_1
```

Connect client (IP address can be different for your containers). 

```
sudo apt install postgresql-client -y
Connect to postgres
PGUSER=my_user PGPASSWORD=my_password  psql --user my_user -d my_database -h 172.18.0.2
```

Connect to primary container
```
docker exec -it docker_postgresql-primary_1 bash
```