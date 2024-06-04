# mariadb Notes

You need to initialize the MariaDB data directory prior to startin gthe
service. This can be done with mariadb-install-db command, e.g.:
    # mariadb-install-db --user=mysql --basedir=/usr
      --datadir=/var/lib/mysql
Optional dendecies for mariadb:

- cracklib: for cracklib plugin [installed]
- curl: for ha_s3 plugin [installed]
- galera: for MariaDB cluster with Galera WSREP
- judy: for Open Query GRAPH (OQGRAPH) computation engine
- perl-dbd-mariadb: for mariadb-hotcopy, mariadbconvert-table-format and
  mariadb-stpermission
- python-mysqlclient: for myrocks_hotbackup
- xz: lzma provider [installed]

Users:

- root@localhost
    - password - dointhedishes98
- ewiens@localhost
    - password - dointhedishes98

You can start the MariaDB daemon with:
cd '/usr' ; /usr/bin/mariadb-safe --datadir='./data'

You can test the MariaDB daemon with mariadb-test-run.pl
cd '/usr/mariadb-test' : perl mariadb-test-run.pl

To start mariadb at boot you have to copy
support-files/mariadb.service to the right place for your system

From installation script:
>Two all-privilege accounts were created.
>One is root@localhost, it has no password, but you need to be system 'root'
>user to connect. Use, for example, sudo mysql.
>The second is mysql@localhost, it has no password either, but you need to
>be the system 'mysql' user to connect.
>After connecting you can set the password, if you would need to be able to
>connect as any of these users with a password and without sudo.

To enable MariaDB:

- Run `systemctl start mariadb.service`
- Run `systemctl enable mariadb.service`
- Both prompts will ask for user password

To set passwords for users created by installation:
- Run `sudo mariadb -u root`
- Run `SET PASSWORD FOR 'root'@'localhost' = PASSWORD('[password]');`
- Run `CREATE USER 'name'@'localhost' IDENTIFIED BY '[password]`
- Run `GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost'`
This will create another superuser with the same privileges as root.
