docker cp ../../sources/ oracle-nosql:/u02/setup
docker exec -it oracle-nosql sudo -u ons /u02/setup/sources/nosql_install.sh
docker exec -it oracle-nosql bash