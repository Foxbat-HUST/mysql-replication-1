FROM mysql:8.0.27
ARG password
ENV MYSQL_ROOT_PASSWORD=$password
ENV MYSQL_DATABASE=replication
COPY ./slave/my.cnf /etc/mysql
COPY ./container_script/import.sh /dump/
