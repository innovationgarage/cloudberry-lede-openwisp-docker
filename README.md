# OpenWISP enabled OpenWRT LEDE docker image
This image is based on https://hub.docker.com/r/oskarirauta/lede-docker / https://github.com/oskarirauta/lede-docker but adds
built-in support for OpenWISP. Specifically, it allows setting the openwisp URL, UUID and Key from docker environment variables.

Usage:

    docker run -d \
      -e OPENWISP_URL=http://openwisp.innovationgarage.tech/cloudberry \
      -e OPENWISP_UUID=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa \
      -e OPENWISP_KEY=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa \
      cloudberry-lede-openwisp-docker:latest
