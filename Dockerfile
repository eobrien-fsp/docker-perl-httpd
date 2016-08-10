FROM ejspr5tr4/perl-base:v20160810

MAINTAINER "Eugene O'Brien <e.obrien@sportstg.com>"

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    apache2 \
    libapache2-mod-perl2

RUN rm -rf /var/lib/apt/lists/*

COPY ["apache2.conf","/etc/apache2/sites-available/000-default.conf"]
RUN ["a2enmod","headers"]

#Suppress warning about servername. Not really nescessary
#RUN echo 'ServerName localhost' >> /etc/apache2/apache2.conf

#RUN ["a2dissite","000-default"]

EXPOSE 80

VOLUME ["/var/www/"]

CMD ["/usr/sbin/apache2ctl","-DFOREGROUND"]
