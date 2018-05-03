URL ?= http://192.168.4.66:8000
UUID ?= 6cef271d7a6840e58a22665d489fd550
KEY ?= ZNJABufyUuxxPjVhfnAYfNOfNbjvxdXj
IMAGE ?= cloudberry-lede-openwisp-docker:latest
NAME ?= cloudberry

image:
	docker build -t cloudberry-lede-openwisp-docker:latest .

run: stop
	docker run -d 			\
	  --name ${NAME}		\
	  -e OPENWISP_URL=${URL} 	\
	  -e OPENWISP_UUID=${UUID} 	\
	  -e OPENWISP_KEY=${KEY} 	\
	  ${IMAGE}

stop:
	-docker rm -f ${NAME}

attach:
	docker exec -ti ${NAME} sh

log%:
	docker exec -ti ${NAME} logread

restart_config:
	docker exec -ti ${NAME} sh -c '/etc/init.d/openwisp_config restart'
