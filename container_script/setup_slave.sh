#!/bin/bash
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "CHANGE MASTER TO MASTER_HOST='master', MASTER_USER='repl', MASTER_PASSWORD='$1', MASTER_LOG_FILE='$2', MASTER_LOG_POS=$3;"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "START SLAVE"
