FROM oskarirauta/lede-docker:latest
MAINTAINER RedHog (Egil Moeller) egil@innovationgarage.no

ENV OPENWISP_URL None
ENV OPENWISP_UUID None
ENV OPENWISP_KEY None

RUN opkg update
RUN opkg install openwisp-config-openssl
RUN opkg install openvpn-openssl
RUN cd /etc/rc.d; ln -s ../init.d/firewall S19firewall

ADD init-openwisp.sh /sbin/init-openwisp.sh
CMD ["/bin/busybox", "sh", "/sbin/init-openwisp.sh"]
