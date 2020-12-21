# elasticsearch
elasticsearch for quick starter

## Usage
in your terminal
```
chmod 755 ./start.sh
export ELASTICSEARCH_PASSWORD=<YOUR PASSWORD>
./start.sh <CONAINER_NAME>
```

when you want to reset elasticsearch container, remove created folder and remove docker
```
rm -r <CONTAINER_NAME_FOLDER>
docker stop <CONTAINER_NAME>
docker rm <CONTAINER_NAME>
```