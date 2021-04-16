
sudo docker stop `sudo docker ps -a -q`
sudo docker-compose -f conf/docker-compose.yml up --build -d