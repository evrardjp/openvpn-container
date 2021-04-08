#!/usr/bin/env sh
mkdir -p /run/openvpn
mkdir -p /dev/net
mknod /dev/net/tun c 10 200

iptables -F
iptables -I FORWARD -i tun0 -o eth0 -m conntrack --ctstate NEW -j ACCEPT
iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE

chown -R nobody:nogroup /etc/openvpn
chmod -R 700 /etc/openvpn

exec /usr/sbin/openvpn --writepid /run/openvpn/server.pid --cd /etc/openvpn --config /etc/openvpn/server.conf --script-security 2
