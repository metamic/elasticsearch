#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: ./start.sh <container name>"
    exit
fi

source .env
if [ -z "$ELASTICSEARCH_PASSWORD" ]; then
    echo 'Please input your elastic password like "export ELASTICSEARCH_PASSWORD=<PASSWORD>"'
    exit 1
fi

CONTAINER_NAME=$1

if [ ! -d "$PWD/$1" ]; then
    cp -r $PWD/conf/elasticsearch $PWD/$1
else
    echo "'$1' already exists"
    exit 1
fi


sed -i "s/\$CONTAINER_NAME/$CONTAINER_NAME/g" $PWD/$1/docker-compose.yml
sed -i "s/\$ELASTIC_VERSION/$ELASTIC_VERSION/g" $PWD/$1/docker-compose.yml

cd $1
docker-compose up --build --detach
cd ..