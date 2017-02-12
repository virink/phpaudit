#!/bin/bash

while [ "$virink_host" == "" ];do
    sleep 10s;
done

sed -i "s/xdebug.remote_host=virink_host/xdebug.remote_host=$virink_host/g" /etc/php5/php.ini