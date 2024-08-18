#
# this file is generated via docker-builder/generate.pl
#
# do not edit it directly
#
FROM perl:5.40.0

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

ENV MOJO_VERSION 9.38

RUN cpanm Mojolicious@"$MOJO_VERSION" \
  && rm -r /root/.cpanm

RUN set -ex \
  && export GNUPGHOME="$(mktemp -d)" \
  && for key in \
    177F4010FE56CA3336300305F1656F24C74CD1D8 \
    430BDF5C56E7C94E848EE60C1C4CBDCDCD2EFD2A \
    4D1BB29D63D98E422B2113B19334A25F8507EFA5 \
  ; do \
    gpg --batch --keyserver hkp://keys.opengpg.org --recv-keys "$key" || \
    gpg --batch --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" || \
    gpg --batch --keyserver hkp://keyserver.ubuntu.com --recv-keys "$key" ; \
  done \
  && gpg --batch --export 177F4010FE56CA3336300305F1656F24C74CD1D8 430BDF5C56E7C94E848EE60C1C4CBDCDCD2EFD2A 4D1BB29D63D98E422B2113B19334A25F8507EFA5 > /etc/apt/trusted.gpg.d/mariadb.gpg \
  && command -v gpgconf > /dev/null && gpgconf --kill all \
  && rm -rf "$GNUPGHOME" \
  && add-apt-repository 'deb http://ftp.osuosl.org/pub/mariadb/repo/11.1/debian bookworm main' \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    libmariadb-dev \
  && rm -r /var/lib/apt/lists/*

ENV DBD_MYSQL_CONFIG mariadb_config

RUN cpanm DBD::MariaDB Mojo::mysql \
  && rm -r /root/.cpanm

ARG NOW=not-set
LABEL org.opencontainers.image.authors="Tekki <tekki@tekki.ch>"
LABEL org.opencontainers.image.created=$NOW
LABEL org.opencontainers.image.description="Mojolicious is a real-time web framework and web development toolkit written in Perl."
LABEL org.opencontainers.image.documentation=https://github.com/Tekki/docker-mojolicious/blob/master/README.md
LABEL org.opencontainers.image.licenses=Artistic-2.0
LABEL org.opencontainers.image.source=https://github.com/Tekki/docker-mojolicious/blob/master/mariadb/Dockerfile
LABEL org.opencontainers.image.title=Mojolicious
LABEL org.opencontainers.image.url=https://github.com/Tekki/docker-mojolicious
LABEL org.opencontainers.image.version=9.38-mariadb

CMD ["/bin/bash", "-c"]
