# Eco Game Server Docker Image

## How to use

```
mkdir -p ~/eco-server/Storage ~/eco-server/Configs

docker run -v ~/eco-server/Storage:/srv/eco-server/Storage -v ~/eco-server/Configs:/srv/eco-server/Configs --network="host" t3hk0d3/eco-server:0.7.1.2-beta
```

## How to build

```
make build
```