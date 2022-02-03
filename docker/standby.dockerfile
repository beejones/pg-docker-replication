FROM postgres:14.1-alpine
RUN apk add --no-cache wget
RUN set -ex && apk --no-cache add sudo
RUN apk add --update iputils
RUN apk add --update runuser

# Copy the entry point file with the right priviledges
#COPY ./docker-entrypoint.sh /docker-entrypoint.sh
#RUN chmod +x /docker-entrypoint.sh
#COPY ./docker-entrypoint.sh /docker-entrypoint-initdb.d/docker-entrypoint.sh
#RUN chmod +x /docker-entrypoint-initdb.d/docker-entrypoint.sh

#USER postgres
#CMD ["/docker-entrypoint.sh", "postgres", "-D", "/var/lib/postgresql/data"]
#CMD sudo /docker-entrypoint.sh postgres -D /var/lib/postgresql/data
#COPY ./init-user-db.sh /docker-entrypoint-initdb.d/init-user-db.sh
#RUN chmod 0666 /docker-entrypoint-initdb.d/init-user-db.sh

#ENTRYPOINT ["/docker-entrypoint.sh"]
#CMD ["/docker-entrypoint.sh", "postgres", "postgres"]