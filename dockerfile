FROM debian
MAINTAINER samuel <samguegon@gmail.com>

ENV HOME /root

RUN apt-get update

RUN apt-get install -y nano wget curl unzip lynx apache2 php5 libapache2-mod-php5 php5-mysql

RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections

RUN echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections

RUN apt-get install -y mysql-server

ADD https://es.wordpress.org/wordpress-4.2.2-es_ES.zip /var/www/wordpress.zip

ENV HOME /var/www/html/

RUN rm /var/www/html/index.html

RUN unzip /var/www/wordpress.zip  -d /var/www/

RUN cp -r /var/www/wordpress/* /var/www/html/

RUN chown -R www-data:www-data /var/www/html/

RUN rm /var/www/wordpress.zip

ADD /script.sh /script.sh

EXPOSE 80

CMD ["/bin/bash"]

ENTRYPOINT ["./script.sh"]


