#!/bin/bash

# Collects log files from Dockers
/root/copy_docker_files.sh
/root/make_backup.sh

# Send file to S3
export AWS_ACCESS_KEY_ID=jgfabjkfajgankfkfasbkfa
export AWS_SECRET_ACCESS_KEY=bfgofbkfbvhoslgjpjgnlbkhpjsnhonslnl

mv /tmp/mysql_backup.sql /tmp/mysql_backup-`date +%d%b%y`.sql
mv /tmp/docker_logfiles.tar.gz /tmp/docker_logfiles-`date +%d%b%y`.tar.gz

aws s3 cp /tmp/mysql_backup-`date +%d%b%y`.sql s3://sagar-backup/backup/
aws s3 cp /tmp/docker_logfiles-`date +%d%b%y`.tar.gz s3://sagar-backup/logs/
