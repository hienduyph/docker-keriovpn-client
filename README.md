# Docker Kerio VPN Client

## Build

```bash
docker build . -t quay.io/hienduyph/keriovpn-client
```

## Running the client

The default port is: 4090

Obtain the fingerprint

```bash
openssl s_client -connect YOUR_SERVER:YOUR_PORT < /dev/null 2>/dev/null | openssl x509 -fingerprint -md5 -noout -in /dev/stdin
```

*kerio-svc.conf*

```
<config>
  <connections>
    <connection type="persistent">
      <server>YOUR_SERVER</server>
      <port>YOUR_PORT</port>
      <username>YOUR_USERNAME</username>
      <password>YOUR_PASSWORD</password>
      <fingerprint>FINGERPRINT_ABOVE</fingerprint>
      <active>1</active>
    </connection>
  </connections>
</config>
```

**Spin up the client**
```bash
docker run -d --name keriovpn --net=host --privileged -v /path/to/kerio-kvc.conf:/etc/kerio-kvc.conf quay.io/hienduyph/keriovpn-client
```

From now, you could check the container logs to see detail the login address, and ask Network admin about DNS server.

Hope this help!
