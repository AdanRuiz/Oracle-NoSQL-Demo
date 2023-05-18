# Oracle NoSQL 1x3 Demo

**Oracle NoSQL 1x3 demo in a single docker instance<sup>1</sup>.**

Linux is supported, but I still dont have the automated commands feel free to parse bat files into sh files.

## Requirements
1. Have installed Rancher Desktop (for Oracle Developers) or Docker (public).
2. Clone or download project files

## Instructions for Windows
### Install
1. Double click build_container.bat
2. Execute deploy_nosql.bat to install Oracle NoSQL
3. To stop just double click stop.bat

### Relaunch docker instance (After HOST machine restart)
1. Double click start.bat

### Reset Environment (Deletes image and container)
1. Double click delete_image_container.bat

## Useful Links
NoSQL Examples from Dario: https://github.com/dario-vega
Java "No Login" Download:  https://gist.github.com/wavezhang/ba8425f24a968ec9b2a8619d7c2d86a6
Additional  NoSQL Docker:  https://github.com/oracle/docker-images/blob/main/NoSQL/README.md


<sup>1</sup> Non-Secure Store for Educative purposes.