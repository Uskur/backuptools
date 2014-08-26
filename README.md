mysqlbackup
===========

Backup every table in every database into individual compressed files.

Install wget https://raw.githubusercontent.com/Uskur/mysqlbackup/master/mybackup.bash; chmod 755 mybackup.bash
Edit nano mybackup.bash
Run ./mybackup.bash

A MySQL user like so is ideal:

GRANT SELECT, RELOAD, FILE, SHOW DATABASES, SUPER, LOCK TABLES, SHOW VIEW ON *.* TO '[YOURUSER]'@'localhost' IDENTIFIED BY PASSWORD '[YOURPASS]';

