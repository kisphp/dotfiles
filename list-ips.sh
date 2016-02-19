#!/bin/bash

function ips {
	echo "---------------------"
	
	for ip in `ifconfig | grep inet | cut -d" " -f2  | grep -v '::' | grep -v '127.0'`;
	do
		echo "--> $ip"
	done
	
	echo "---------------------"	
}

# 
#
# Usage:
#   ips
#
#
