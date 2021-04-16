#!/bin/sh

#docker 설치
sudo curl -fsSL https://get.docker.com/ | sh
 
#docker 설치 후 docker 시작
sudo service docker start

#docker 공식 github에서 다운로드
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

#docker-compose가 제대로 실행이 안될시
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

#Cluster에서 사용할 폴더 지정
mkdir -p /home/redis/redis-cluster
cd /home/redis/redis-cluster