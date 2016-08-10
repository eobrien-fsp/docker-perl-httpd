FROM ejspr5tr4/perl-base:v20160810

MAINTAINER "Eugene O'Brien <e.obrien@sportstg.com>"

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    apache2 \
    libapache2-mod-perl2

RUN rm -rf /var/lib/apt/lists/*

EXPOSE 80

ENTRYPOINT ["/usr/sbin/apache2ctl","-D FOREGROUND"]

