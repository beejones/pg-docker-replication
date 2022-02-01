# pg-docker-replication
Create a docker setup with multiple servers which replicate

# Create a single postgres container

Install the postgres client, run the container and connect the client.

```bash
sudo apt install postgresql-client
docker-compose -f docker/single-pg.yaml up
PGPASSWORD=postgres psql -U postgres -h 0.0.0.0
```

Stopping the container
```bash
docker-compose -f docker/single-pg.yaml stop
```
# Create primary and standby containers

Remove any cached builds:
```
docker builder prune
```

```
docker-compose -f docker/docker-replication.yaml up --build
```