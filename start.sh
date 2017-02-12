#!/bin/bash

/sed.sh &

nginx &

php-fpm &

mysqld --user=mysql &

echo "Start successfully!"

tail -f /tmp/access.log /tmp/error.log