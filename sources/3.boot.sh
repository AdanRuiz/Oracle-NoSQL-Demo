#!/bin/bash
echo "################# 3. boot A #####################"
java -Xmx64m -Xms64m -jar $KVHOME/lib/kvclient.jar

java -jar $KVHOME/lib/kvstore.jar makebootconfig \
-root $KVROOT1 \
-port $KVPORT1 \
-host $KVHOST \
-harange 5010,5020 \
-servicerange 5021,5049 \
-admin-web-port 5999 \
-store-security none \
-mgmt jmx \
-capacity 1 \
-memory_mb $KVMEMORY \
-storagedir $KVDATA1 \
-storagedirsize $KVSTOSIZE

nohup java -jar $KVHOME/lib/kvstore.jar start -root $KVROOT1 >/dev/null 2>&1 </dev/null &

echo "################# 3. boot B #####################"
java -Xmx64m -Xms64m -jar $KVHOME/lib/kvclient.jar

java -jar $KVHOME/lib/kvstore.jar makebootconfig \
-root $KVROOT2 \
-port $KVPORT2 \
-host $KVHOST \
-harange 6010,6020 \
-servicerange 6021,6049 \
-admin-web-port 6999 \
-store-security none \
-mgmt jmx \
-capacity 1 \
-memory_mb $KVMEMORY \
-storagedir $KVDATA1 \
-storagedirsize $KVSTOSIZE

nohup java -jar $KVHOME/lib/kvstore.jar start -root $KVROOT2 >/dev/null 2>&1 </dev/null &

echo "################# 3. boot C #####################"
java -Xmx64m -Xms64m -jar $KVHOME/lib/kvclient.jar

java -jar $KVHOME/lib/kvstore.jar makebootconfig \
-root $KVROOT3 \
-port $KVPORT3 \
-host $KVHOST \
-harange 7010,7020 \
-servicerange 7021,7049 \
-admin-web-port 7999 \
-store-security none \
-mgmt jmx \
-capacity 1 \
-memory_mb $KVMEMORY \
-storagedir $KVDATA3 \
-storagedirsize $KVSTOSIZE

nohup java -jar $KVHOME/lib/kvstore.jar start -root $KVROOT3 >/dev/null 2>&1 </dev/null &
sleep 5
#sudo netstat -ntpl | grep 50