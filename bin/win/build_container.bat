docker network create --subnet=192.168.0.0/24 onsnet
docker build -t oracle-nosql-img:latest ../../
docker run -it --privileged --name oracle-nosql -p 8000:8000 -p 8984:8984 -p 8985:8985 oracle-nosql-img:latest