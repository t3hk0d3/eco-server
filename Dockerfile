FROM debian:stretch-slim

### Install Dependencies (Mono, unzip, ...)
### TODO: Move to base image
ADD install_deps.sh / 
RUN /install_deps.sh 

### Basic settings for Eco Server
WORKDIR /srv/eco-server
EXPOSE 2999/udp 3000 3001
VOLUME ["/srv/eco-server/Storage", "/srv/eco-server/Configs"]

CMD ["mono", "EcoServer.exe", "-nogui"]

ARG ECO_FILENAME
LABEL eco.version="unknown"

ADD ${ECO_SERVER_FILENAME} /tmp

### Install Eco Server
ADD install.sh ./
RUN /srv/eco-server/install.sh ${ECO_FILENAME}
