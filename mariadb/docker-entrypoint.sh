#! /bin/bash
#
# this file is generated via docker-builder/update.pl
#
# do not edit it directly
#

if [ -f cpanfile ]; then
  cpanm --installdeps .
fi

exec "$@"
