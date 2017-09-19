#!/bin/bash

BKP_PATH="/tmp"

# Remove OLD backups
rm -rf $BKP_PATH/mysql.sql

# Make a New Backup
docker run --rm --link sagar-mysql:sagar-mysql -v $BKP_PATH:/backup mysql sh -c 'mysqldump -uroot -psagar -P3306 -hsagar-mysql mysql > backup/docker_mysql_backup.sql'

mysqldump -u root -psagar --all-databases > "$BKP_PATH"/alldb.sql
