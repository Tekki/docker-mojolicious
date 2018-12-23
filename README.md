<!-- this file is generated via docker-builder/update.pl, do not edit it directly -->
# Warning: Experimental!

# What is Mojolicious?

[Mojolicious](https://mojolicious.org) is a real-time web framework and web development toolkit written in [Perl](https://www.perl.org).

All the images come with Mojolicious installed together with
[Cpanel::JSON::XS](https://metacpan.org/pod/Cpanel::JSON::XS),
[DBI](https://metacpan.org/pod/DBI),
[EV](https://metacpan.org/pod/EV),
[IO::Socket::Socks](https://metacpan.org/pod/IO::Socket::Socks),
[IO::Socket::SSL](https://metacpan.org/pod/IO::Socket::SSL),
[Net::DNS::Native](https://metacpan.org/pod/Net::DNS::Native),
[Role::Tiny](https://metacpan.org/pod/Role::Tiny) and
[SQL::Abstract](https://metacpan.org/pod/SQL::Abstract).

# Supported tags and respective Dockerfile links

* Mojolicious: [8.10, latest (main/Dockerfile)](https://github.com/Tekki/docker-mojolicious/blob/master/main/Dockerfile).

* Mojolicious with DBD::MariaDB: [8.10-mariadb, mariadb (mariadb/Dockerfile)](https://github.com/Tekki/docker-mojolicious/blob/master/mariadb/Dockerfile).

* Mojolicious with DBD::mysql: [8.10-mysql, mysql (mysql/Dockerfile)](https://github.com/Tekki/docker-mojolicious/blob/master/mysql/Dockerfile).

# How to use this image

Go to your code folder, call Mojolicious to create the basic application structure.

    $ docker run --rm -v "$(pwd):/usr/src/app" tekki/mojolicious mojo generate app MyApp

Start the application as daemon.

    $ cd my_app
    $ docker run -d --rm -v "$(pwd):/usr/src/app" -p 3000:3000 tekki/mojolicious morbo script/my_app

Browse to [localhost:3000](http://localhost:3000) and start to edit the application.
