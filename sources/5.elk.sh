#netstat -nltp | grep 5601
# ps -ef |grep elast

#enable collector service
java -jar $KVHOME/lib/kvstore.jar runadmin -port $KVPORT1 -host $KVHOST load -file /u02/setup/sources/elk.kvs

#Modify elastic config
echo "-Xms20Mb" >> jvm.options
echo "-Xmx20Mb" >> jvm.options

echo "path.data: /path/to/data" >> elasticsearch.yml
echo "path.logs: /path/to/logs" >> elasticsearch.yml

#modify logstash
cp /u02/setup/sources/elk/logstash.config /u02/elk/logstash-8.7.0
cp /u02/setup/sources/elk/filebeat.yml /u02/elk/filebeat-8.7.0