docker run -d -p 8888:8888 -v D:/Giang_DE/EESARDocker/giang:/home/giang --name=eesar mort/eesardocker
http://localhost:8888/tree
interface.ipynb 

docker stop eesar
docker start eesar


docker system prune -a --volumes

# List all containers (only IDs)
docker ps -aq

# Stop all running containers
docker stop $(docker ps -aq)

# Remove all containers
docker rm $(docker ps -aq)

# Remove all images
docker rmi $(docker images -q)

# How to build a Docker image and upload it to Docker Hub
# Build docker images from Docker file for studying purpose
cd src
docker build -f Dockerfile -t giang .
docker image tag giang giangtran0912/giang-eesardocker:latest
docker image push giangtran0912/giang-eesardocker:latest

mkdir working
cd working
docker run -d -p 8888:8888 -v D:/Giang_DE/GIT/EESARDocker/working:/home/working --name=giang giang
http://localhost:8888/tree


cd src
docker build -f Dockerfile -t giang-eesardocker .
docker image tag giang-eesardocker giangtran0912/giang-eesardocker:latest
docker image push giangtran0912/giang-eesardocker:latest


mkdir working
cd working
docker run -d -p 8888:8888 -v D:/Giang_DE/GIT/EESARDocker/working:/home/working --name=giang giang-eesardocker
http://localhost:8888/tree
