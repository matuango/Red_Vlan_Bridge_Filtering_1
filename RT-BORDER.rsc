/ip address
add address=10.0.0.1/30 interface=ether5
add address=10.180.100.2/30 interface=ether1
/ip firewall nat 
add action=masquerade chain=srcnat out-interface=ether1
/ip route
 add dst-address=0.0.0.0/0 gateway=10.180.100.1
/system identity
set name=BORDER-RT
/tool romon
set enabled=yes
