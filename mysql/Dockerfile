#
# this file is generated via docker-builder/generate.pl
#
# do not edit it directly
#
FROM perl:5.34.0

WORKDIR /usr/src/app
EXPOSE 3000 8080

RUN groupadd --gid 1000 perl \
  && useradd --uid 1000 --gid perl --shell /bin/bash --create-home perl

RUN set -ex \
  && apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    dirmngr \
  && cpanm \
    Cpanel::JSON::XS \
    DBI \
    EV \
    Future::AsyncAwait \
    IO::Socket::Socks \
    Net::SSLeay \
    IO::Socket::SSL \
    Net::DNS::Native \
    Role::Tiny \
    SQL::Abstract \
  && rm -r /var/lib/apt/lists/* \
  && rm -r /root/.cpanm

ENV MOJO_VERSION 9.19

RUN cpanm Mojolicious@"$MOJO_VERSION" \
  && rm -r /root/.cpanm

RUN set -ex \
  && export GNUPGHOME="$(mktemp -d)" \
  && for key in \
    A4A9406876FCBD3C456770C88C718D3B5072E1F5 \
  ; do \
    gpg --batch --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" || \
    gpg --batch --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "$key" || \
    gpg --batch --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" ; \
  done \
  && gpg --batch --export A4A9406876FCBD3C456770C88C718D3B5072E1F5 > /etc/apt/trusted.gpg.d/mysql.gpg \
  && command -v gpgconf > /dev/null && gpgconf --kill all \
  && rm -rf "$GNUPGHOME" \
  && add-apt-repository 'deb http://repo.mysql.com/apt/debian/ stretch mysql-8.0' \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    libmysqlclient-dev \
  && rm -r /var/lib/apt/lists/*

RUN cpanm DBD::MariaDB DBD::mysql Mojo::mysql \
  && rm -r /root/.cpanm

ARG NOW=not-set
LABEL org.opencontainers.image.authors="Tekki <tekki@tekki.ch>"
LABEL org.opencontainers.image.created=$NOW
LABEL org.opencontainers.image.description="Mojolicious is a real-time web framework and web development toolkit written in Perl."
LABEL org.opencontainers.image.documentation=https://github.com/Tekki/docker-mojolicious/blob/master/README.md
LABEL org.opencontainers.image.licenses=Artistic-2.0
LABEL org.opencontainers.image.source=https://github.com/Tekki/docker-mojolicious/blob/master/mysql/Dockerfile
LABEL org.opencontainers.image.title=Mojolicious
LABEL org.opencontainers.image.url=https://github.com/Tekki/docker-mojolicious
LABEL org.opencontainers.image.version=9.19-mysql

CMD ["/bin/bash", "-c"]
