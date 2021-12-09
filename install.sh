#!/bin/bash

(
#server
sleep 1
echo "domain.com"

#autodetect
sleep 1
echo "no"

#fingerprint ..
sleep 1
echo "AA:BB:CC:DD:EE:FF"

#username
sleep 1
echo "dummy"

#password
sleep 1
echo "pass"

sleep 1) | dpkg -i /tmp/kerio.deb
