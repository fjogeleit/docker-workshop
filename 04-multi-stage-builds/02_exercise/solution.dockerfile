FROM node:14 as builder

WORKDIR /app

COPY vue-example .

RUN npm install \
    && npm run build

FROM nginx:alpine

WORKDIR /var/www/app

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80