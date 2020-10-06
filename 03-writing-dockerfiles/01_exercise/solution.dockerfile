FROM nginx:alpine

COPY hello_world /usr/share/nginx/html

EXPOSE 80