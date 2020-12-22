# Debian 10 - Constructor
FROM debian:buster-slim as builder

# Variable
ENV DEBIAN_FRONTEND noninteractive

# Instalacion dependencias
RUN  apt-get update && \
     apt-get install -y wget apt-transport-https ca-certificates locales git build-essential uuid-dev psmisc && \
     apt-get update

# Compila Xupnpd
RUN cd / && git clone https://github.com/clark15b/xupnpd2 && \
    cd /xupnpd2 && make --file Makefile.linux

# Debian 10
FROM debian:buster-slim as run

# Instalacion dependencias
RUN  apt-get update && \
     apt-get install -y wget && \
     apt-get clean && \
     apt-get autoclean && \
     apt-get -y autoremove && \
     rm -rf /var/lib/apt/lists/*

# Configura Xupnpd v2
COPY --from=builder /xupnpd2/ /xupnpd2
WORKDIR /xupnpd2
RUN rm /xupnpd2/media/* && \
    sed -i "s|http_port=4044|http_port=3044|g" "/xupnpd2/xupnpd.cfg" && \
    sed -i "s|#upnp_device_name=xupnpd2|upnp_device_name=Lordpedal IPTV v2|g" "/xupnpd2/xupnpd.cfg"
ADD lordpedal.sh .
RUN chmod +x lordpedal.sh
RUN useradd -ms /bin/bash xupnpd
RUN chown xupnpd /xupnpd2 -R
USER xupnpd

# Variables M3U
ENV M3U_URL https://www.tdtchannels.com/lists/tvradio.m3u

# Arranque Docker
CMD ["/bin/bash", "./lordpedal.sh"]
