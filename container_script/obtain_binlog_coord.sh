#!/bin/bash
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "SHOW MASTER STATUS" > coord.txt
