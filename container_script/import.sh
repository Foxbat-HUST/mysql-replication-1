#!/bin/bash
mysql --user=root --password=$MYSQL_ROOT_PASSWORD  replication < "$1"
rm $1
