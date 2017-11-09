FROM nginx:alpine

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN apk add --update openssh && \
	ssh-keygen -A && \
	cd && \
	mkdir -p .ssh && \
	touch .ssh/authorized_keys && \
	chmod 600 .ssh/authorized_keys

ADD nginx/ /etc/nginx

EXPOSE 80 443 22

CMD ["sh", "-c", "/usr/sbin/sshd; nginx -g 'daemon off;'"]