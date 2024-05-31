# mySQL

To connect run:
mysql -u root
mysql -u root -p

Password:
ethan

To start mysql now and restart at login:
brew services start mysql
brew services restart mysql
brew services stop mysql

Or, if you don't want/need a background service you can just run:
/opt/homebrew/opt/mysql/bin/mysqld_safe --datadir\=/opt/homebrew/var/mysql

We've installed your MySQL database without a root password. To secure it run:
mysql_secure_installation

My SQL is configured to only allow connections fro loaclahost by default
