#!/bin/bash
export KVROOT1=/u02/nosql/kvroot
export KVROOT2=/u03/nosql/kvroot
export KVROOT3=/u04/nosql/kvroot

export KVDATA1=/u02/nosql/data
export KVDATA2=/u03/nosql/data
export KVDATA3=/u04/nosql/data

export KVHOME=/u02/nosql/kv-22.3.32
export KVHOST=`hostname -f`
export KVSTORE=NoSQLDemo

export KVPORT1=5000
export KVPORT2=6000
export KVPORT3=7000

export KVSTOSIZE="3500-MB"

export KVMEMORY=1000


echo $KVROOT
echo $KVDATA
echo $KVHOME
echo $KVHOST
echo $KVSTORE


alias kv_sql="java -jar $KVHOME/lib/sql.jar -helper-hosts $KVHOST:$KVPORT -store $KVSTORE "
alias kv_admin="java -jar $KVHOME/lib/kvstore.jar runadmin -port $KVPORT -host $KVHOST"
alias kv_ping="java -jar $KVHOME/lib/kvstore.jar ping  -port $KVPORT -host $KVHOST"
alias kv_proxy="java -jar $KVHOME/lib/httpproxy.jar -helperHosts $KVHOST:$KVPORT -storeName $KVSTORE -httpPort 80 -verbose true"
alias kv_stop="java -jar $KVHOME/lib/kvstore.jar stop -root $KVROOT"
alias kv_start="java -jar $KVHOME/lib/kvstore.jar start -root $KVROOT"