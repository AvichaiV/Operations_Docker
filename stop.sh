#!/bin/bash

echo "Do you want to Stop the SQL Docker (y/n) ?"
read stopsql
if [ "$stopsql" == y ]; 
then
    echo -e "\e[32mStoping the SQL Docker\e[0m"
    docker-compose -f mysql.yml down
fi
echo -e "\e[32mStoping the Nginx Docker\e[0m"
docker-compose -f nginx.yml down
