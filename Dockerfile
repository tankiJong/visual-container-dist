FROM node:4.3.0-slim

ENV NGINX_VERSION 1.9.11-1~jessie

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
  && echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list \
  && apt-get update \
  && apt-get install -y ca-certificates nginx=${NGINX_VERSION} gettext-base git libpng-dev \
  && rm -rf /var/lib/apt/lists/* \
  && ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

WORKDIR /app

COPY . /app/

ENV APP_ENV=production
ENV API_URL=https://127.0.0.1

RUN cp -r ./* /usr/share/nginx/html/ && \
    rm -rf /app

CMD nginx -g 'daemon off;'
