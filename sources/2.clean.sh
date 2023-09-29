#!/bin/bash
echo "################# 2. clean #####################"
pkill java
rm -rf $KVROOT1 $KVROOT2 $KVROOT3
rm -rf $KVDATA1 $KVDATA2 $KVDATA3
rm -rf /u03/nosql/data
rm -rf /u04/nosql/data


mkdir -p ${KVROOT1}
mkdir -p ${KVROOT2}
mkdir -p ${KVROOT3}

mkdir -p ${KVDATA1}
mkdir -p ${KVDATA2}
mkdir -p ${KVDATA3}

ls -lrtd $KVROOT1
ls -lrt  $KVROOT1

ls -lrtd $KVROOT2
ls -lrt  $KVROOT2

ls -lrtd $KVROOT3
ls -lrt  $KVROOT3

ls -lRtd $KVDATA1
ls -lRt  $KVDATA1

ls -lRtd $KVDATA2
ls -lRt  $KVDATA2

ls -lRtd $KVDATA3
ls -lRt  $KVDATA3

java -Xmx64m -Xms64m -jar $KVHOME/lib/kvclient.jar

echo "################# 2. clean end #####################"