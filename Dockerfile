FROM ubuntu:18.04 
LABEL org.opencontainers.image.authors="bruno.dzogovic@gmail.com"
ENV TZ=Europe/Oslo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && \ 
    	apt-get upgrade --yes && \ 
    	apt-get install --yes \
	net-tools \
        iputils-ping \ 
	software-properties-common \
	apt-transport-https \
        apt-utils \
	&& apt-add-repository ppa:ubuntu-toolchain-r/test -y \ 
	&& apt-get update && apt-get install -y \	
	gcc-9 \
	g++-9 \
	libboost-all-dev \ 
	curl \
        git \
        subversion \
        vim \
	libsctp1 \
        procps \
        tzdata \
        libnettle6 \
        liblapacke \
        libatlas3-base \
        libconfig9 \
        openssl \
	python \
        python3 \
        python3-six \
        python3-requests \
        libusb-1.0-0 \
	unzip \
	iproute2 \
        iperf \
        libyaml-0-2 && \
        rm -rf /var/lib/apt/lists/* && \
	update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 9 && \
	update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 9 && \
        git clone https://gitlab.eurecom.fr/oai/openairinterface5g.git

COPY env.sh /openairinterface5g/env.sh 
WORKDIR /openairinterface5g
RUN ./env.sh  
 
