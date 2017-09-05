#!/bin/bash

# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.
rm -rf /run/httpd/* /tmp/httpd*
htpasswd -b -c /etc/httpd/conf/.htpasswd sagar bangera
cp /auth_basic.conf /etc/httpd/conf.d/.

exec /usr/sbin/apachectl -DFOREGROUND
