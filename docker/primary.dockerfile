FROM bitnami/postgresql:latest
#COPY ./setup-primary.sh /docker-entrypoint-initdb.d/setup-primary.sh
#RUN chmod 0666 /docker-entrypoint-initdb.d/setup-primary.sh
#COPY ./init-user-db.sh /docker-entrypoint-initdb.d/init-user-db.sh
#RUN chmod 0666 /docker-entrypoint-initdb.d/init-user-db.sh
USER root
RUN apt-get update -y && apt-get install vim -y
