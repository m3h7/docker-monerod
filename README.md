
# docker-monerod

## Description

Run a Monero node.

## Build the Docker Image
```
docker-compose build
```

## How to run
### Configure the Daemon
Configure monerod settings/parameters in docker-compose.yml.

### Start the Daemon
Start the daemon and run it in background
```
docker-compose -d up
```

### Stop the Daeomon
Stop the daemon
```
docker-compose down
```
