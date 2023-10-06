FROM ubuntu:latest
LABEL "Author"="Ismyil Muhammed"
LABEL "Project"="WebContainer"
RUN apt update
RUN apt install apache2 -y
WORKDIR /var/www/html
ADD files.tar.gz /var/www/html/
#COPY files.tar.gz /var/www/html/
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
VOLUME /var/log/apache2
EXPOSE 80