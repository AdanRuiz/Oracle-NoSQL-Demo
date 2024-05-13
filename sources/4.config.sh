#!/bin/bash
echo "################# 4. config A #####################"
java -jar $KVHOME/lib/kvstore.jar runadmin -port $KVPORT1 -host $KVHOST load -file /u02/setup/sources/config1x1.kvs
sleep 5
echo "################# 4. config B #####################"
java -jar $KVHOME/lib/kvstore.jar runadmin -port $KVPORT1 -host $KVHOST load -file /u02/setup/sources/config1x3.kvs
sleep 5

echo "################# 4. ONS env vars #####################"
echo "source /u02/setup/sources/1.nosql_env.sh" >> ~/.bash_profile
