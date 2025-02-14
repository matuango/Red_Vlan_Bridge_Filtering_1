/interface ethernet
set [ find default-name=ether2 ] name=ether9
/ip address
add address=10.180.100.1/30 interface=ether9
/ip dhcp-client
add interface=ether1
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
/system identity
set name=ISP2
/tool romon
set enabled=yes