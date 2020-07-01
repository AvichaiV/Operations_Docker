#!/bin/bash
echo -e "\e[32mstart Sql\e[0m"
docker-compose -f mysql.yml up -d
echo -e "\e[32mbuild nginx docker\e[0m"
docker-compose -f nginx.yml build --no-cache --force-rm
echo -e "\e[32mStart nginx docker\e[0m"
docker-compose -f nginx.yml up -d

