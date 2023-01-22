# !/bin/bash

RUNNING_APPLICATION=$(docker ps | grep blue)
DEFAULT_CONF="../nginx/default.conf"

if [ -z "$RUNNING_APPLICATION"  ];then
	echo "blue Deploy..."
  	docker-compose pull blue
    docker-compose up -d blue

  	while [ 1 == 1 ]; do
  		echo "blue health check...."
      REQUEST=$(docker ps | grep blue)
      echo $REQUEST
  		if [ -n "$REQUEST" ]; then
              break ;
          fi
  		sleep 3
      done;

  	sed -i 's/green/blue/g' $DEFAULT_CONF
    docker stop nginx
   	docker rm nginx
   	docker-compose up -d nginx
  	docker-compose stop green
else
	echo "green Deploy..."
  	docker-compose pull green
  	docker-compose up -d green

  	while [ 1 == 1 ]; do
  		echo "green health check...."
  		REQUEST=$(docker ps | grep green)
  		echo $REQUEST
  		if [ -n "$REQUEST" ]; then
  			break ;
  		fi
  		sleep 3
  	done;

  	sed -i 's/blue/green/g' $DEFAULT_CONF
  	docker stop nginx
  	docker rm nginx
  	docker-compose up -d nginx
  	docker-compose stop blue
fi