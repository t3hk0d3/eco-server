
ECO_VERSION ?= 0.7.1.2-beta
ECO_FILENAME = EcoServer_v${ECO_VERSION}.zip
ECO_SERVER_URL = https://s3-us-west-2.amazonaws.com/eco-releases/EcoServer_v${ECO_VERSION}.zip

DOCKER_IMAGE = t3hk0d3/eco-server
DOCKER_TARGET = ${DOCKER_IMAGE}:${ECO_VERSION}

all: build push clean

download:
	if [ ! -f ${ECO_FILENAME} ]; then \
		curl -o "${ECO_FILENAME}" "${ECO_SERVER_URL}"; \
	fi;

verify: download
	shasum -a 256 -c SHA256SUMS

build: verify
	docker build --rm \
							 --label "eco.version=${ECO_VERSION}" \
							 --build-arg ECO_FILENAME="${ECO_FILENAME}" \
							 -t ${DOCKER_TARGET} .

push:
	docker push ${DOCKER_TARGET}

clean:
	rm -rf "${ECO_FILENAME}"
	
