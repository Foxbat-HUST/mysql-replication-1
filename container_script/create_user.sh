#!/bin/bash
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "CREATE USER 'repl'@'$2' IDENTIFIED WITH mysql_native_password BY '$1'"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "GRANT REPLICATION SLAVE ON *.* TO 'repl'@'$2';"
