FROM ubuntu:20.04

RUN apt-get -y update

#the following ARG turns off the questions normally asked for location and timezone for Apache
ARG DEBIAN_FRONTEND=noninteractive 
RUN apt-get -y install apache2

#change working directory to root of apache webhost
WORKDIR var/www/html
RUN echo 'Zinchenko Ihor Jenkins Test 2022!' > /var/www/html/index.html

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
