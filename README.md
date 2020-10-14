# Why this simple repo ?

As a networking and Mikrotik noob, I struggled a lot setting up my wifi. I wanted 2 Ghz and 5 Ghz to be broadcasted by my cAP ac, using Capsman. The problem was that the AP sent "no supported channel" on one of his interface. I finally found a way to make it work, by explicitly adding 'hw-supported-mode' in provisioning. Here is a simple export of the config, maybe it will be usefull to some folks. Don't forget to change the passphrase by the way! 
