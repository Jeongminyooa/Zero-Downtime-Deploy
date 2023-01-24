# !/bin/bash

RUNNING_APPLICATION=$(docker ps | grep blue)
DEFAULT_CONF="/home/ubuntu/zero-downtime-deploy/nginx/default.conf"

if [ -z "$RUNNING_APPLICATION"  ];then
	echo "blue Deploy..."
	 	docker-compose pull blue
    docker-compose up --build -d blue

  	while :
  	do
  		echo "blue health check...."
      REQUEST=$(docker ps | grep blue)
      echo $REQUEST
  		if [ -n "$REQUEST" ]; then
              break ;
          fi
  		sleep 3
      done;

    docker-compose stop green
else
	echo "green Deploy..."
	  docker-compose pull green
  	docker-compose up --build -d green

  	while :
  	do
  		echo "green health check...."
  		REQUEST=$(docker ps | grep green)
  		echo $REQUEST
  		if [ -n "$REQUEST" ]; then
  			break ;
  		fi
  		sleep 3
  	done;

  	docker-compose stop blue
fi