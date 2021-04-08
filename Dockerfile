FROM alpine:latest
RUN apk update --no-cache && apk upgrade --no-cache && apk add --no-cache openvpn iptables
VOLUME ["/etc/openvpn"]
WORKDIR /etc/openvpn
COPY vpn*.sh /
ENTRYPOINT ["/vpn-client.sh"]
