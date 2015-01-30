#!/bin/bash

function help()
{
	echo "Usage: [sudo] ./start_quick_server.sh [OPTIONS] [--debug]"
	echo "Options:"
	echo -e "\t -a | --all \t\t start nginx, redis and beanstalkd"
	echo -e "\t -n | --nginx \t\t start nginx"
	echo -e "\t -b | --beans \t\t start beanstalkd"
	echo -e "\t -r | --redis \t\t start redis"
	echo -e "\t -h | --help \t\t show help\r\n"
	echo "if OPTIONS is not specified, default OPTION is \"-a(--all)\"."
	echo "in default, server will start in release mode, or else it will start in debug mode if you specified \"--debug\" following OPTIONS But NOTICE that \"--debug\" dont take effect except in OPTIONS \"-a(--all)\" and \"-n(--nginx)\""
	echo -e "\r\n"
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





