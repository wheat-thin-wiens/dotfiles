#!/bin/bash

# Flush all rules
iptables -F
iptables -X
iptables -Z

# Flush NAT rules
iptables -t nat -F
iptables -t nat -X
iptables -t nat -Z
