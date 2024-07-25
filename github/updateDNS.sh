DNS=8.8.8.8
D=/etc/resolv.conf

sed -i "s/^nameserver .*/nameserver $DNS/" "$D"
