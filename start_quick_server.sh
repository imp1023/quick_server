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

args = $(getopt -o abrnh -l all,beanstalkd,redis,nginx,help)
if [ $? != 0 ]; then 
	echo "Start Quick Server Terminating..." >&2;
	exit 1;
fi

curDir = $(dirname $(readlink -f $0))
nginxDir = $curDir/openresty/nginx
toolDir = $curDir/openresty/server/actions/tools

$curDir/redis/bin/redis-server $curDir/conf/redis.conf

service mysqld start

cd $nginxDir
. ./sbin/start.sh

cd $toolDir
. ./cleaner.sh  > /dev/null 2> /opt/.cleaner.log &

#cd $CURRDIR





