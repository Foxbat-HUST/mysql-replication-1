#!/bin/bash
dump_file=db.sql
import ( ) {
	line=$(docker ps | grep $1)
	container_id=${line:0:12}
	docker cp ./$dump_file $container_id:/dump/
	echo "copy dump to $1 done."
	docker exec -it $1 ./dump/import.sh ./dump/$dump_file
	echo "import dump data to $1 done."
}
#import dump data for master
import master
#TODO setup replication

#import dump data to slave
import slave


