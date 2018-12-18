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

ENV MOJO_VERSION 8.09

RUN cpanm Mojolicious@"$MOJO_VERSION"

WORKDIR /usr/src/app
EXPOSE 3000 8080

# COPY docker-entrypoint.sh /usr/local/bin
# RUN chmod 0755 /usr/local/bin/docker-entrypoint.sh
# ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["/bin/bash", "-c"]
