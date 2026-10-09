#!/bin/bash

echo "PREROUTING rules:"
iptables -t nat -L PREROUTING -n -v


echo "POSTROUTING rules:"
iptables -t nat -L POSTROUTING -n -v
