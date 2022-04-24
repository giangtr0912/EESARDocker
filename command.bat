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


