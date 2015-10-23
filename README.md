# Experimental Docker Compose for RVI SOTA

Get [docker compose](https://docs.docker.com/compose/install/) (`run.sh` can
download it for you as well).

## Quickstart

```sh
./run.sh
```

## How to run (locally)

1. Server

```sh
docker-compose -p sotaserver -f server.yml up -d
```

2. Client

```sh
docker-compose -p sotadevice -f device.yml up -d
```

3. Core needs to be restarted because of a RVI bug.

```sh
docker restart sotaserver_core_1
```

## How to stop

```sh
docker-compose -p sotaserver -f server.yml stop
docker-compose -p sotadevice -f device.yml stop
```

## How to upgrade (to :latest/:dev on DockerHub)

```sh
docker-compose -p sotaserver -f server.yml pull
docker-compose -p sotadevice -f device.yml pull
docker-compose -p sotaserver -f server.yml up -d
docker-compose -p sotadevice -f device.yml up -d
```

## How to upgrade (local images)

Just rerun `up` for the affected part or call `./run.sh`, Compose will figure
out what needs to be restarted or recreated.
