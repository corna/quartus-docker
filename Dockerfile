FROM ubuntu:18.04
MAINTAINER Nicola Corna <nicola@corna.info>

COPY install_quartus install_quartus.sh /usr/local/bin/

# Quartus 13 (and probably others) requires libpng12, which is not available anymore in Ubuntu 18.04
RUN echo "deb http://security.ubuntu.com/ubuntu xenial-security main" > /etc/apt/sources.list.d/xenial.list && \
	dpkg --add-architecture i386 && \
	apt-get update && \
	apt-get -y upgrade && \
	apt-get -y install libc6:i386 libncurses5:i386 libstdc++6:i386 libxft2:i386 libxext6:i386 libsm6:i386 libpng12-0:i386 libpng12-0 xterm

