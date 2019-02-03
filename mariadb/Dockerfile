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

ENV MOJO_VERSION 8.12

RUN cpanm Mojolicious@"$MOJO_VERSION"

RUN set -e; \
    export GNUPGHOME="$(mktemp -d)"; \
    gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "177F4010FE56CA3336300305F1656F24C74CD1D8"; \
    gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "430BDF5C56E7C94E848EE60C1C4CBDCDCD2EFD2A"; \
    gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "4D1BB29D63D98E422B2113B19334A25F8507EFA5"; \
    gpg --batch --export 177F4010FE56CA3336300305F1656F24C74CD1D8 430BDF5C56E7C94E848EE60C1C4CBDCDCD2EFD2A 4D1BB29D63D98E422B2113B19334A25F8507EFA5 > /etc/apt/trusted.gpg.d/mariadb.gpg; \
    command -v gpgconf > /dev/null && gpgconf --kill all; \
    rm -rf "$GNUPGHOME"; \
    apt-key list

RUN set -e; \
    add-apt-repository 'deb http://ftp.osuosl.org/pub/mariadb/repo/10.3/debian stretch main'; \
    apt-get update

RUN set -e; \
    apt-get install -y --no-install-recommends \
    libmariadb-dev \
    && rm -r /var/lib/apt/lists/*

RUN cpanm DBD::MariaDB

WORKDIR /usr/src/app
EXPOSE 3000 8080

COPY docker-entrypoint.sh /usr/local/bin
RUN chmod 0755 /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["/bin/bash", "-c"]
