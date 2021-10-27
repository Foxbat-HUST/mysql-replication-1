#!/bin/bash
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "CREATE USER 'repl'@'slave' IDENTIFIED BY '$1'"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "GRANT REPLICATION SLAVE ON *.* TO 'repl'@'slave';"
