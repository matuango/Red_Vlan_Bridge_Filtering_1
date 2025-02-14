/interface bridge 
add frame-types=admit-only-vlan-tagged name=bridge1 vlan-filtering=yes
/interface bridge port
add bridge=bridge1 frame-types=admit-only-untagged-and-priority-tagged interface=ether5 pvid=10
add bridge=bridge1 frame-types=admit-only-untagged-and-priority-tagged interface=ether4 pvid=10
add bridge=bridge1 frame-types=admit-only-vlan-tagged interface=ether1
/interface bridge vlan
add bridge=bridge1 tagged=ether1 vlan-ids=10
/ip dhcp-client
set disabled=yes
/system identity
set name=TECNICA
/tool romon
set enabled=yes
