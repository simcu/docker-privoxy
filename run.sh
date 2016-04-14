#!/bin/sh
if [ ! -f "/etc/privoxy/config" ]; then 
	if [ -z $SOCKS5_HOST ]; then
		SOCKS5_HOST=127.0.0.1
	fi
	if [ -z $SOCKS5_PORT ]; then
		SOCKS5_PORT=1080
	fi
	echo "listen-address 0.0.0.0:8118" > /etc/privoxy/config
	echo "debug 1" >> /etc/privoxy/config
	echo "forward-socks5 / $SOCKS5_HOST:$SOCKS5_PORT ." >> /etc/privoxy/config
fi 
echo "===== PRIVOXY CONIFG START ====="
cat /etc/privoxy/config
echo "=====  PRIVOXY CONIFG END  ====="
privoxy --no-daemon /etc/privoxy/config