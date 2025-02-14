/interface bridge 
add name=bridge1 vlan-filtering=yes
/interface bridge port
add bridge=bridge1 interface=ether1 frame-types=admit-only-vlan-tagged
add bridge=bridge1 interface=ether3 frame-types=admit-only-vlan-tagged
add bridge=bridge1 interface=ether4 frame-types=admit-only-vlan-tagged
add bridge=bridge1 interface=ether5 frame-types=admit-only-vlan-tagged
/interface bridge vlan 
add bridge=bridge1 tagged=ether1,ether5 vlan-ids=10
add bridge=bridge1 tagged=ether1,ether4 vlan-ids=20
add bridge=bridge1 tagged=ether1,ether3 vlan-ids=30
/ip dhcp-client
set disabled=yes
/system identity
set name=SW-CORE
/tool romon
set enabled=yes
