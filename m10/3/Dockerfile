#Docker file to build Docker Image of Apache WebServer running on Ubuntu server 20.04

FROM ubuntu:20.04

RUN apt-get -y update
RUN apt-get -y install apache2

RUN echo 'Zinchenko Ihor SandBox 2021!' > /var/www/html/index.html

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
