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

ENV MOJO_VERSION 8.16

RUN cpanm Mojolicious@"$MOJO_VERSION"

RUN set -ex \
  && export GNUPGHOME="$(mktemp -d)" \
  && for key in \
    B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8 \
  ; do \
    gpg --batch --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" || \
    gpg --batch --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "$key" || \
    gpg --batch --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" ; \
  done \
  && gpg --batch --export B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8 > /etc/apt/trusted.gpg.d/pg.gpg \
  && command -v gpgconf > /dev/null && gpgconf --kill all \
  && rm -rf "$GNUPGHOME" \
  && add-apt-repository 'deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main 11' \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    libpq-dev \
  && rm -r /var/lib/apt/lists/*

RUN cpanm DBD::Pg Mojo::Pg

CMD ["/bin/bash", "-c"]