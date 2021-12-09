#!/usr/bin/env bash
set -o nounset

main() {
  /etc/init.d/kerio-kvc start
  sleep 5

  # workaround for fix the real ip address of kvpn
  # see more: https://aur.archlinux.org/packages/kerio-control-vpnclient/#comment-795258
  ip link set dev kvnet address "$(awk '/VPN driver opened/ {print $NF}' /var/log/kerio-kvc/debug.log | tail -n1 | sed 's/-/:/g')"

  # show logs in order to check docker
  bash -c "tail -f /var/log/kerio-kvc/*.log" &
}

close() {
  echo "stopping"
  /etc/init.d/kerio-kvc stop
  trap - SIGINT SIGTERM
  exit 0
}

trap close SIGINT SIGTERM

main

sleep infinity & wait
