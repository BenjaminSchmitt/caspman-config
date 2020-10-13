# Simple script to deploy 2 Ghz and 5 Ghz wifi networks, using Mikrotik Capsman.
# Tested on RouterOs 6.47.4 (RB4011)

/interface bridge 
add name=bridge-defconf

/caps-man channel
add band=2ghz-g/n name=channel-2g
add band=5ghz-n/ac name=channel-5g

/caps-man datapath
add bridge=bridge-defconf name=datapath-bridge

# change the passphrase !!! 
/caps-man security
add authentication-types=wpa2-psk name=security-wpa2 passphrase=IAmAPassword

/caps-man configuration
add channel=channel-2g datapath=datapath-bridge name=cfg-2g security=security-wpa2 ssid=wifi-2g
add channel=channel-5g datapath=datapath-bridge name=cfg-5g security=security-wpa2 ssid=wifi-5g

/caps-man manager
set enabled=yes

/caps-man manager interface
set [ find default=yes ] forbid=yes
add disabled=no interface=bridge-defconf

# problem was hw-supported-modes
/caps-man provisioning
add action=create-dynamic-enabled hw-supported-modes=b,g master-configuration=cfg-2g name-format=identity
add action=create-dynamic-enabled hw-supported-modes=ac,an master-configuration=cfg-5g
