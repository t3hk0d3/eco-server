
ECO_VERSION ?= 0.7.2.4-beta

DOCKER_IMAGE = t3hk0d3/eco-server
DOCKER_TARGET = ${DOCKER_IMAGE}:${ECO_VERSION}

all: build push clean

build:
	docker build --rm \
	--label "eco.version=${ECO_VERSION}" \
	--build-arg ECO_VERSION="${ECO_VERSION}" \
	-t ${DOCKER_TARGET} \
	-t ${DOCKER_IMAGE} \
	.

push:
	docker push ${DOCKER_IMAGE}

clean:
	rm -rf "${ECO_FILENAME}"

run:
	mkdir -p ~/eco-server/Storage ~/eco-server/Configs && \
	docker run -d --name "eco-server" \
	-v ~/eco-server/Storage:/srv/eco-server/Storage \
	-v ~/eco-server/Configs:/srv/eco-server/Configs \
	--network=host \
	${DOCKER_TARGET}
	
