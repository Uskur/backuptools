#!/bin/bash

DB_user=""
DB_pass=""
BACKUP_TO=""

#foreach db
for DB in $(/usr/bin/mysql -Bs -u $DB_user -p$DB_pass -e 'show databases' | grep -v information_scheme)
do
        #foreach table in db
        for TABLE in $(/usr/bin/mysql -NBA -u $DB_user -p$DB_pass -D $DB -e 'show tables')
        do
            echo "$DB.$TABLE"
            /usr/bin/mysqldump -u $DB_user -p$DB_pass $DB $TABLE | gzip > $BACKUP_TO/$DB.$TABLE.sql.gz
        done
done
echo "complete"
