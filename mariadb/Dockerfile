#
# this file is generated via docker-builder/update.pl
#
# do not edit it directly
#

FROM perl:5.28

RUN set -e; \
    mkdir -p /usr/src/app; \
    apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    dirmngr \
    && rm -r /var/lib/apt/lists/*

RUN set -e; \
    cpanm Cpanel::JSON::XS DBI EV IO::Socket::Socks IO::Socket::SSL Net::DNS::Native Role::Tiny SQL::Abstract

ENV MOJO_VERSION 8.10

RUN cpanm Mojolicious@"$MOJO_VERSION"

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE 1
RUN apt-key adv --no-tty --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xcbcb082a1bb943db

RUN set -e; \
    add-apt-repository 'deb http://ftp.osuosl.org/pub/mariadb/repo/10.3/debian stretch main'; \
    apt-get update

RUN set -e; \
    apt-get install -y --no-install-recommends --allow-unauthenticated \
    libmariadb-dev \
    mariadb-client \
    && rm -r /var/lib/apt/lists/*

RUN cpanm DBD::MariaDB

WORKDIR /usr/src/app
EXPOSE 3000 8080

# COPY docker-entrypoint.sh /usr/local/bin
# RUN chmod 0755 /usr/local/bin/docker-entrypoint.sh
# ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["/bin/bash", "-c"]
