#!/usr/bin/env sh
mkdir -p /run/openvpn
mkdir -p /dev/net
mknod /dev/net/tun c 10 200

chown -R nobody:nogroup /etc/openvpn
chmod -R 700 /etc/openvpn

exec /usr/sbin/openvpn --writepid /run/openvpn/server.pid --cd /etc/openvpn --config /etc/openvpn/client.conf --script-security 2
