#!/bin/bash
docker cp ../../sources/ oracle-nosql:/u02/setup
docker exec -it oracle-nosql bash -c 'chown -R ons:ons /u02/setup'
docker exec -it oracle-nosql bash -c '(cd /u02/setup/sources/;chmod +x *.sh)'
#docker exec -it oracle-nosql sudo -u ons /u02/setup/sources/nosql_install.sh
docker exec -it oracle-nosql sudo runuser -l ons -c /u02/setup/sources/nosql_install.sh
docker exec -it oracle-nosql bash