#!/bin/bash
USR=ons

##### Validate User
if ! [ $(whoami) = $USR ]; then
   echo "Please run this script as $USR"
   exit 1
fi

##### Download NoSQL
cd /u02/nosql
if [ -d kv-22.3.32 ]
then
    echo "KVHOME found"
else
      wget http://download.oracle.com/otn-pub/otn_software/nosql-database/kv-ce-22.3.32.zip
      unzip kv-ce-22.3.32.zip
fi


##### Oracle NoSQL Setup
. /u02/setup/sources/1.nosql_env.sh
. /u02/setup/sources/2.clean.sh
. /u02/setup/sources/3.boot.sh
. /u02/setup/sources/4.config.sh