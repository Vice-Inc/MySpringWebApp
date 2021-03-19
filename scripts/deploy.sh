#!/usr/bin/env bash

mvn clean

mvn package

echo 'Copy files..'

scp -i ~/.ssh/id_rsa_drucoder \
      target/MySpringWebApp-1.0-SNAPSHOT.jar \
      vice@34.82.159.75:home/USER/

echo 'Restart server...'

ssh -i ~/.ssh/id_rsa_drucoder vice@34.82.159.75 <<EOF

pgrep java | xargs kill -9
nohup java -jar MySpringWebApp-1.0-SNAPSHOT.jar > log.txt &

EOF

echo 'Bye'