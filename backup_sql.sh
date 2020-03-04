#!/bin/bash

# MySQL backup script

PATH=$PATH:/usr/local/bin

MUSER='root'
MPASS='123456'

#DIR=`date +"%Y-%m-%d"`
#DATE=`date +"%Y%m%d"`

MYSQL="mysql --user=$MUSER --password=$MPASS --skip-column-names";

for s in mysql ttt `$MYSQL -e "SHOW DATABASES LIKE '%\_db'"`;
    do
	mkdir $s;
	for t in `$MYSQL -e "SHOW TABLES FROM $s"`;
		do
		    /usr/bin/mysqldump --user="$MUSER" --password="$MPASS" --opt $s $t | gzip -1 > $s/$t.gz;
		done
    done

