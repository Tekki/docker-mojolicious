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

RUN cpanm DBD::SQLite Mojo::SQLite

CMD ["/bin/bash", "-c"]
