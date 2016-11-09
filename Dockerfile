FROM daocloud.io/nginx:1.11.3-alpine

ADD . /usr/share/nginx/html/
WORKDIR /usr/share/nginx/html/

CMD sed -i -e "s/http:\/\/54.249.38.5:8081/$ENV_API/g" ./scripts/main.js && \
 nginx -g 'daemon off;'