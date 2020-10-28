# Operations_Docker
1. Create a SQL server using __Docker__ and loade a pre existing data (__Docker Compose__)
2. create a new docker with multi stages (__dockerfile__) 
  a. stage one: __centos 7__ docker with a program that will run a query and get the data (using Join, CASE,...) and save it to a file as HTML using __python__
  b. stage two: __Ngnix__ docker that will copy the created file from stage one and expose it on port 9980

## To create the Dockers
run ./start.sh
this will run:
  docker-compose on mysql.yml
  docker-compose on nginx.yml

## To stop the Dockers
run ./stop.sh
