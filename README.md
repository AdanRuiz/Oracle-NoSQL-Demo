# Oracle NoSQL 1x3 Demo

**Oracle NoSQL 1x3 demo in a single docker instance<sup>1</sup>.**

Linux is supported, but I still dont have the automated commands feel free to launch bat files in sh .

## Requirements
* Have installed Rancher Desktop (for Oracle Developers) or Docker (public).
* Clone or download project files
* Check for LF in sh files in sources folder

## Instructions for Windows
### Install
1. Double click build_container.bat
2. Execute start.bat
3. Execute deploy_nosql.bat to install Oracle NoSQL

To stop just double click stop.bat

### Reset Environment (Deletes image and container)
1. Double click delete_image_container.bat

## Testing Install
1) Launch start.bat 
2) Execute kv_ping
3) Execute kv_admin 
    1. SHOW TOPOLOGY
4) Execute kv_sql
    1. Create Database:
        *    CREATE TABLE sequence(
                seqId INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
                host STRING,
                numTest INTEGER,
                PRIMARY KEY (seqId)
            )
    2. Insert data:
        *    INSERT INTO sequence (host, numTest) values('localhost',0)
        *    INSERT INTO sequence (host, numTest) values('192.168.1.254',0)
5) Test by app
    1. Install Visual Studio Code Oracle NoSQL Extension
    2. Create a new connection
    3. Host: 
        http://localhost:8985
    4. Namespace must be empty


## Useful Links
NoSQL Examples from Dario: https://github.com/dario-vega

Java "No Login" Download:  https://gist.github.com/wavezhang/ba8425f24a968ec9b2a8619d7c2d86a6

Additional  NoSQL Docker:  https://github.com/oracle/docker-images/blob/main/NoSQL/README.md




<sup>1</sup> Non-Secure Store for Educative purposes.

Regards
Adan