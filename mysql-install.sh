#!/bin/bash

# 拉取mysql80镜像
docker pull mysql:8.0

# 创建并启动容器
docker run -d \
  --name mysql80 \
  -p 3306:3306 \
  -v /var/mysql80/data:/var/lib/mysql \
  -v /var/mysql80/my.cnf:/etc/mysql/conf.d/my.cnf \
  -e MYSQL_ROOT_PASSWORD=123456 \
  -e MYSQL_USER=ly \
  -e MYSQL_PASSWORD=123456 \
  -e MYSQL_USER=nzc \
  -e MYSQL_PASSWORD=123456 \
  mysql:8.0

# 开启远程访问
docker exec -it mysql80 mysql -uroot -p123456 -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;"
docker exec -it mysql80 mysql -uroot -p123456 -e "GRANT ALL PRIVILEGES ON *.* TO 'ly'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;"
docker exec -it mysql80 mysql -uroot -p123456 -e "GRANT ALL PRIVILEGES ON *.* TO 'nzc'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;"

# 重启容器使配置生效
docker restart mysql80

