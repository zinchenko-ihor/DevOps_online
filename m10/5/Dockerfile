#Docker file to build Docker Image of Apache WebServer running on Ubuntu server 20.04

FROM ubuntu:18.04

RUN apt-get -y update
RUN apt-get -y install apache2
ENV UNAME="Zinchenko Ihor"

RUN echo "DEVOPS=$UNAME" > /var/www/html/index.html

CMD ["/usr/sbin/apache2ctl", "-D","FOREGROUND"]
EXPOSE 80

