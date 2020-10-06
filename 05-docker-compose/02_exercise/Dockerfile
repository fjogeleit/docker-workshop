FROM node:14-alpine

WORKDIR /var/www

COPY fastify-example .

RUN npm install

ENTRYPOINT ["node", "index.js"]