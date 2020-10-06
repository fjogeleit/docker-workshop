FROM nginx

RUN apt-get update && apt-get install -y apt-utils rsync make g++ \
    && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt install -y nodejs

WORKDIR /var/www/app

COPY vue-example .

RUN npm install \
    && npm run build \
    && mv /var/www/app/dist/* /usr/share/nginx/html

EXPOSE 80