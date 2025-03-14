FROM ubuntu:latest

RUN apt-get -y update && apt-get -y install nginx curl

COPY content/index.html /var/www/html/index.nginx-debian.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]