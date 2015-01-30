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

args=$(getopt -o abrnh --long all,beanstalkd,redis,nginx,help -n 'Start Quick Server' -- "$@")
if [ $? != 0 ]; then 
	echo "Start Quick Server Terminating..." >&2;
	exit 1;
fi

curDir=$(dirname $(readlink -f $0))
nginxDir=$curDir/openresty/nginx
toolDir=$curDir/openresty/server/actions/tools

eval set -- "$args"

declare -i debug=0
declare -i all=0
declare -i beans=0
declare -i redis=0
declare -i nginx=0
if [ $# -eq 1 ] ; then
	all=1
fi

while true ; do
	case "$1" in
		--debug)
			debug=1
			shift
			;;
		-a|--all)
			all=1
			shift
			;;
		-b|--beanstalkd)
			beans=1
			shift
			;;
		-r|--redis)
			redis=1
			shift
			;;
		-n|--nginx)
			nginx=1
			shift
			;;
		-h|--help)
			help;
			exit 0
			;;
		--)
			shift;
			break
			;;
		*)
			echo "invalid option: $1"
			exit 1
			;;
	esac
done

#debug take effect only on command "-a | -n"
if [ nginx -ne 1 ] && [ all -ne 1 ]; then
	debug = 0
fi

#start nginx
if [ $nginx -eq 1 ] || [ $all -eq 1 ]; then
	if [ $debug -eq 1 ] ; then
		echo -e "Start NGINX in \033[31m DEBUG \033[0m mode..."
		sed -i "1a error_log logs/error.log debug;" $nginxDir/conf/nginx.conf
		sed -i "$# lua_code_cache on#lua_code_cache off#g" $nginxDir/conf/nginx.conf
	else
		echo -e "Start NGINX in \033[31m RELEASE \033[0m mode..."
		sed -i "1a error_log logs/error.log" $nginxDir/conf/nginx.conf
		sed -i "$# lua_code_cache off#lua_code_cache on#g" $nginxDir/conf/nginx.conf
	fi
	nginx -p $(pwd) -c $nginxDir/conf/nginx.conf
	echo "Start Nginx DONE..."
fi
