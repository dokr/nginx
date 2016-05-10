FROM alpine:edge

MAINTAINER Chuanjian Wang <me@ckeyer.com>

ADD nginx/ /etc/nginx

RUN apk add --update nginx && \
	mkdir -p /run/nginx && \
	rm -rf /var/cache/apk/* && \
	ln -sf /dev/stdout /var/log/nginx/access.log && \
	ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]