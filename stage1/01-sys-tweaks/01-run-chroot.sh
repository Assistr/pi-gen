#!/bin/bash -e

if ! id -u pi >/dev/null 2>&1; then
	adduser --disabled-password --gecos "" pi
fi
echo 'pi:$1$xyz$FdF184irLr1Pgdesc98BP1' | chpasswd -e
echo 'root:root' | chpasswd
