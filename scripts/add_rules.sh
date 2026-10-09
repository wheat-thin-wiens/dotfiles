#!/bin/bash

ethtool -K nic0 tso off gso off gro off || true

echo 0 > /sys/class/net/vmbr0/bridge/multicast_snooping
ip link set vmbr0 allmulticast on

iptables -t nat -A PREROUTING -d 10.208.1.10/32 -p tcp --dport 80 -j DNAT --to-destination 10.208.1.24:80
iptables -t nat -A PREROUTING -d 10.208.1.10/32 -p tcp --dport 443 -j DNAT --to-destination 10.208.1.24:443

iptables -t nat -A POSTROUTING -d 10.208.1.24 -p tcp -m multiport --dports 80,443 -m conntrack --ctstate DNAT -j MASQUERADE

# iptables -t nat -A POSTROUTING -d 10.208.1.24 -p tcp --dport 80 -j MASQUERADE
# iptables -t nat -A POSTROUTING -d 10.208.1.24 -p tcp --dport 443 -j MASQUERADE

# Old Rules
# iptables -t nat -A PREROUTING -d 10.208.1.10 -p tcp --dport 80 -j DNAT --to-destination 10.208.1.24:80
# iptables -t nat -A PREROUTING -d 10.208.1.10 -p tcp --dport 443 -j DNAT --to-destination 10.208.1.24:443
# iptables -t nat -A PREROUTING -i tailscale0 -p tcp --dport 80 -j DNAT --to-destination 10.208.1.24:80
# iptables -t nat -A PREROUTING -i tailscale0 -p tcp --dport 443 -j DNAT --to-destination 10.208.1.24:443
# iptables -t nat -A POSTROUTING -o vmbr0 -j MASQUERADE
# iptables -t nat -A POSTROUTING -o vmbr0 ! -d 10.208.1.0/24 -j MASQUERADE
