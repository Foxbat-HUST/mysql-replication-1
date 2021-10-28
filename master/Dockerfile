FROM mysql:8.0.27
ARG password
ENV MYSQL_ROOT_PASSWORD=$password
ENV MYSQL_DATABASE=replication
COPY ./master/my.cnf /etc/mysql
COPY ./container_script/import.sh /dump/
COPY ./container_script/create_user.sh /script/
COPY ./container_script/xpt_mst_info.sh /script/
