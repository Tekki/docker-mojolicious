#
# this file is generated via docker-builder/generate.pl
#
# do not edit it directly
#
FROM perl:5.28.2

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
    IO::Socket::Socks \
    Net::SSLeay \
    IO::Socket::SSL \
    Net::DNS::Native \
    Role::Tiny \
    SQL::Abstract \
  && rm -r /var/lib/apt/lists/*

ENV MOJO_VERSION 8.17

RUN cpanm Mojolicious@"$MOJO_VERSION"

RUN set -ex \
  && export GNUPGHOME="$(mktemp -d)" \
  && for key in \
    177F4010FE56CA3336300305F1656F24C74CD1D8 \
    430BDF5C56E7C94E848EE60C1C4CBDCDCD2EFD2A \
    4D1BB29D63D98E422B2113B19334A25F8507EFA5 \
  ; do \
    gpg --batch --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" || \
    gpg --batch --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "$key" || \
    gpg --batch --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" ; \
  done \
  && gpg --batch --export 177F4010FE56CA3336300305F1656F24C74CD1D8 430BDF5C56E7C94E848EE60C1C4CBDCDCD2EFD2A 4D1BB29D63D98E422B2113B19334A25F8507EFA5 > /etc/apt/trusted.gpg.d/mariadb.gpg \
  && command -v gpgconf > /dev/null && gpgconf --kill all \
  && rm -rf "$GNUPGHOME" \
  && add-apt-repository 'deb http://ftp.osuosl.org/pub/mariadb/repo/10.3/debian stretch main' \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    libmariadb-dev \
  && rm -r /var/lib/apt/lists/*

ENV DBD_MYSQL_CONFIG mariadb_config

RUN cpanm DBD::MariaDB DBD::mysql Mojo::mysql

CMD ["/bin/bash", "-c"]
