#!/bin/bash

url=http://10.112.29.56/
c=100
n=100000
forn=10
all=0
if [ "$1" = "install" ];then
     yum install httpd-tools
elif [ "$1" = "test" ]; then
	for((i=1;i<=${forn};i++));do
    rps=`ab -n ${n} -c ${c} ${url} |grep "Requests per second" | awk '{print $4}'`
    all=$(echo "${all}+${rps}"|bc)
    echo ${rps}
	done
	avg=$(echo "scale=2;${all}/${forn}"|bc)
	echo "avg is ${avg}"
else
    echo "it is ab test!"
fi
