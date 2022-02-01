# pg-docker-replication
Create a docker setup with multiple servers which replicate

# Create a single postgres container

Install the postgres client, run the container and connect the client.

```bash
sudo apt install postgresql-client -y
docker-compose -f docker/single-pg.yaml up
PGPASSWORD=postgres psql -U postgres -h 0.0.0.0
```

Stopping the container
```bash
docker-compose -f docker/single-pg.yaml stop
```
# Create primary and standby containers

Remove any cached builds and build new containers
```
docker builder prune -f && docker-compose -f docker/docker-compose-replication.yaml up --build
```

Inspect IP Address of standby and primary
```
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' docker_pg_standby_1
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' docker_pg_primary_1
```

Connect client (IP address can be different for your containers). 
```
sudo apt install postgresql-client -y
PGPASSWORD=postgres psql -U postgres -h 172.21.0.2
```