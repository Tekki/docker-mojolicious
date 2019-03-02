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
    cpanm Cpanel::JSON::XS DBI EV IO::Socket::Socks Net::SSLeay IO::Socket::SSL Net::DNS::Native Role::Tiny SQL::Abstract

ENV MOJO_VERSION 8.12

RUN cpanm Mojolicious@"$MOJO_VERSION"

RUN set -e; \
    export GNUPGHOME="$(mktemp -d)"; \
    gpg --batch --keyserver ha.pool.sks-keyservers.net --recv-keys "B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8"; \
    gpg --batch --export B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8 > /etc/apt/trusted.gpg.d/pg.gpg; \
    command -v gpgconf > /dev/null && gpgconf --kill all; \
    rm -rf "$GNUPGHOME"; \
    apt-key list

RUN set -e; \
    add-apt-repository 'deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main 11'; \
    apt-get update

RUN set -e; \
    apt-get install -y --no-install-recommends \
    libpq-dev \
    && rm -r /var/lib/apt/lists/*

RUN cpanm DBD::Pg Mojo::Pg

WORKDIR /usr/src/app
EXPOSE 3000 8080

COPY docker-entrypoint.sh /usr/local/bin
RUN chmod 0755 /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["/bin/bash", "-c"]
