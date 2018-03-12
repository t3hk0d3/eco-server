# Eco Game Server Docker Image

## How to use

```
mkdir -p ~/eco-server/Storage ~/eco-server/Configs

docker run -d --name "eco-server" -v ~/eco-server/Storage:/srv/eco-server/Storage -v ~/eco-server/Configs:/srv/eco-server/Configs --network=host t3hk0d3/eco-server:latest
```

## How to build

```
make build
```