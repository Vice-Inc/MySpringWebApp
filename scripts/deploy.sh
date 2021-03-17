#!/usr/bin/env bash

mvn clean package

echo 'Copy files..'

scp -i ~/.ssh/id_rsa_drucoder \
      target/MySpringWebApp-1.0-SNAPSHOT.jar \
      USER@192.192.192.192:home/USER/

echo 'Restart server...'

ssh -i ~/.ssh/id_rsa_drucoder USER@192.192.192.192 <<EOF

pgrep java |  | xargs kill -9
nohup java -jar MySpringWebApp-1.0-SNAPSHOT.jar > log.txt &

EOF

echo 'Bye'