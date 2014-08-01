# First try
FROM ubuntu:14.04
MAINTAINER Joshua Hargrove "jhargr200@gmail.com"
RUN apt-get -y update
RUN apt-get -y install apache2
RUN apt-get -y install salt-minion
RUN mkdir -p /var/lock/apache2
RUN mkdir -p /etc/salt
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_SERVERADMIN admin@localhost
#ENV APACHE_SERVERNAME fuckingthing.doesntexist.com
ENV APACHE_SERVERALIAS docker.localhost
ENV APACHE_DOCUMENTROOT /var/www/html
RUN echo 'root:P4rSl3y' | chpasswd
EXPOSE 80
#RUN rm -rf /etc/apache2/sites-enabled/000-default.conf
ADD minion /etc/salt/minion
ADD start.sh /start.sh
RUN chmod 0755 /start.sh

CMD ["bash", "start.sh"]
CMD ["/usr/bin/salt-minion"]
