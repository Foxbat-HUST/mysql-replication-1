#!/bin/bash
dump_file=db.sql
con_id(){
	line=$(docker ps | grep $1)
	id=${line:0:12}
	echo $id
}
import(){
	id=$(con_id $1)
	docker cp ./$dump_file $id:/dump/
	echo "copy dump to $1 done."
	docker exec -it $1 ./dump/import.sh ./dump/$dump_file
	echo "import dump data to $1 done."
}

#import dump data for master
import master
#create replica user in master
printf "Enter password for replica user: \n"
read -s password
slave_host=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' slave)
docker exec -it master ./script/create_user.sh $password $slave_host
#find binlog coordinates
docker exec -it master ./script/xpt_mst_info.sh
mst_con_id=$(con_id master)
docker cp $mst_con_id:/coord.txt ./coord.txt
#import dump data to slave
import slave
docker exec -it slave ./script/setup_slave.sh $password $(cat coord.txt | grep master)


