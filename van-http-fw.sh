#!/bin/bash

if [[ $http_proxy != "" ]]; then
	# echo "empty"
	export http_proxy= https_proxy=
else
	# echo "set"
	export http_proxy=socks5://127.0.0.1:7070 https_proxy=socks5://127.0.0.1:7070
fi

echo http_proxy="$http_proxy"
echo https_proxy="$https_proxy"