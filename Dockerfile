FROM debian:stretch-slim

### Install Dependencies (Mono, unzip, ...)
### TODO: Move to base image
ADD install_deps.sh / 
RUN /install_deps.sh 

### Basic settings for Eco Server
WORKDIR /srv/eco-server
EXPOSE 2999/udp 2999 3000 3001

CMD ["/srv/eco-server/start.sh"]

ADD SHA256SUMS ./

ARG ECO_VERSION
ENV ECO_VERSION=${ECO_VERSION}
LABEL eco.version=${ECO_VERSION}

### Install Eco Server
ADD install.sh ./
ADD start.sh ./

RUN /srv/eco-server/install.sh
