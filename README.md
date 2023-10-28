<!-- this file is generated via docker-builder/generate.pl, do not edit it directly -->

# What is Mojolicious?

[Mojolicious](https://mojolicious.org) is a real-time web framework and web development toolkit written in [Perl](https://www.perl.org).


The images are based on perl:5.38.0 and provide Mojolicious installed together with
[Cpanel::JSON::XS](https://metacpan.org/pod/Cpanel::JSON::XS),
[DBI](https://metacpan.org/pod/DBI),
[EV](https://metacpan.org/pod/EV),
[Future::AsyncAwait](https://metacpan.org/pod/Future::AsyncAwait),
[IO::Socket::Socks](https://metacpan.org/pod/IO::Socket::Socks),
[Net::SSLeay](https://metacpan.org/pod/Net::SSLeay),
[IO::Socket::SSL](https://metacpan.org/pod/IO::Socket::SSL),
[Net::DNS::Native](https://metacpan.org/pod/Net::DNS::Native),
[Role::Tiny](https://metacpan.org/pod/Role::Tiny),
[SQL::Abstract](https://metacpan.org/pod/SQL::Abstract).

# Supported tags and respective Dockerfile links

* Mojolicious: [9.35, 9, latest (main/Dockerfile)](https://github.com/Tekki/docker-mojolicious/blob/master/main/Dockerfile)

* Mojolicious with Mojo::mysql and the MariaDB libraries: [9.35-mariadb, 9-mariadb, mariadb (mariadb/Dockerfile)](https://github.com/Tekki/docker-mojolicious/blob/master/mariadb/Dockerfile)

* Mojolicious with Mojo::mysql and the MySQL libraries ¹

* Mojolicious with Mojo::Pg: [9.35-pg, 9-pg, pg (pg/Dockerfile)](https://github.com/Tekki/docker-mojolicious/blob/master/pg/Dockerfile)

* Mojolicious with Mojo::SQLite: [9.35-sqlite, 9-sqlite, sqlite (sqlite/Dockerfile)](https://github.com/Tekki/docker-mojolicious/blob/master/sqlite/Dockerfile)

`mariadb` and `mysql` both include DBD::MariaDB and DBD::mysql. The difference
is in the C libraries they are built with.

¹ For the moment the `mysql` tag is not updated because the libraries
don't compile on Debian Bookworm.

# How to use this image

## Simple application

Go to your code folder, call Mojolicious to create the basic application
structure with you as the owner.

    $ docker container run --rm -u $UID -v "$(pwd):/usr/src/app" tekki/mojolicious mojo generate app MyApp

Start the application as daemon.

    $ cd my_app
    $ docker container run -d --rm -v "$(pwd):/usr/src/app" -p 3000:3000 tekki/mojolicious morbo script/my_app

To run the container in the foreground and read the output, omit the `-d`.

    $ docker container run --rm -v "$(pwd):/usr/src/app" -p 3000:3000 tekki/mojolicious morbo script/my_app

Browse to [localhost:3000](http://localhost:3000) and edit the code in the
current folder. If you are on Linux or MacOS, the server will restart whenever
you change a file. On Windows this works if you use Docker Desktop with WSL 2.

To switch from development to production an run the application as daemon in
the full featured non-blocking web server start it with

    $ docker container run -d --rm -v "$(pwd):/usr/src/app" -p 3000:3000 tekki/mojolicious script/my_app prefork

# Source

The source of this image on [GitHub](https://github.com/Tekki/docker-mojolicious).
