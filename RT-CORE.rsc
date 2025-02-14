/interface bridge
add name=bridge1 vlan-filtering=yes
/interface bridge port
add bridge=bridge1 interface=ether5 frame-types=admit-only-vlan-tagged
/interface bridge vlan
add bridge=bridge1 tagged=bridge1 vlan-ids=10,20,30
/interface vlan
add interface=bridge1 name=vlan10 vlan-id=10
add interface=bridge1 name=vlan20 vlan-id=20
add interface=bridge1 name=vlan30 vlan-id=30
/ip address
add address=192.168.10.254/24 interface=vlan10
add address=192.168.20.254/24 interface=vlan20
add address=192.168.30.254/24 interface=vlan30
add address=10.0.0.2/30 interface=ether1
/ip pool
add name=dhcp_pool1 ranges=192.168.10.1-192.168.10.150
add name=dhcp_pool2 ranges=192.168.20.1-192.168.20.150
add name=dhcp_pool3 ranges=192.168.30.1-192.168.30.150
/ip dhcp-server
add address-pool=dhcp_pool1 disabled=no interface=vlan10 name=dhcp1 
add address-pool=dhcp_pool2 disabled=no interface=vlan20 name=dhcp2 
add address-pool=dhcp_pool3 disabled=no interface=vlan30 name=dhcp3 
/ip dhcp-server network
add address=192.168.10.0/24 dns-server=8.8.8.8 gateway=192.168.10.254
add address=192.168.20.0/24 dns-server=8.8.8.8 gateway=192.168.20.254
add address=192.168.30.0/24 dns-server=8.8.8.8 gateway=192.168.30.254 
/ip firewall nat 
add action=masquerade chain=srcnat out-interface=ether1
/tool romon
set enabled=yes
/system identity
set name=RT-CORE
