#one time (creates and runs container)
docker run --name mysql-db -e MYSQL_ROOT_PASSWORD=tester -p 3306:3306 -d mysql
