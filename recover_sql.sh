#!/bin/bash
#

PATH=$PATH:/usr/local/bin

DB=test_db;
OUTDB=$DB;

MUSER='root'
MPASS='123456'

cd /var/cache/rsnapshot/alpha.0/db/$DB;

for t in `ls -1`;
    do
	echo "--> $t... ";
	zcat $t | /usr/bin/mysql --user=$MUSER --password=$MPASS $OUTDB;
    done

