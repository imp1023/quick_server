#!/bin/bash

function help()
{
	echo "Usage: [sudo] ./start_quick_server.sh [OPTIONS] [--debug]"
	echo "Options:"
	echo "\t -a | --all \t\t start nginx, redis and beanstalkd"
	echo "\t -n | --nginx \t\t start nginx"
	echo "\t -b | --beanstalkd \t\t start beanstalkd"
	echo "\t -r | --redis \t\t start redis"
	echo "\t -h | --help \t\t show help"
	echo "if OPTIONS is not specified, default OPTION is \"-a(--all)\"."
	echo "in default, server will start in release mode, or else it will start in debug mode if you specified \"--debug\" following OPTIONS"
	echo "But NOTICE that \"--debug\" dont take effect except in OPTIONS \"-a(--all)\" and \"-n(--nginx)\""
}

help

#CURRDIR=$(dirname $(readlink -f $0))
#NGINX_DIR=$CURRDIR/openresty/nginx/
#SRCDIR=$CURRDIR/openresty/server/actions/tools/

#$CURRDIR/redis/bin/redis-server $CURRDIR/conf/redis.conf

#service mysqld start

#cd $NGINX_DIR
#. ./sbin/start.sh

#cd $SRCDIR
#. ./cleaner.sh  > /dev/null 2> /opt/.cleaner.log &

#cd $CURRDIR





