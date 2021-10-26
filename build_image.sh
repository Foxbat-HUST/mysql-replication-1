#!/bin/bash
printf "start build image \n"
printf "Enter password: \n"
read -s password
printf "Confirm password: \n"
read -s cfm_password
if [ $password != $password ]
then
	echo "Password is not match!"
	echo "Build exit"
	exit 0
fi
docker build -f ./master/Dockerfile -t master --no-cache	 --build-arg password=$password .
# start master service and create dump file.
# save this dump file to /slave/init_db
docker build -f ./slave/Dockerfile   -t slave --no-cache --build-arg password=$password .
