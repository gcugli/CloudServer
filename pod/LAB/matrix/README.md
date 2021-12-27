# Matrix Server



### Generating a configuration file
```
docker-compose run --rm \
    -e SYNAPSE_SERVER_NAME=cugli.net \
    -e SYNAPSE_REPORT_STATS=no \
    synapse generate
```


~~docker-compose run --rm  synapse generate~~


#### Set TLS Fingerprints

```bash
openssl s_client -servername matrix.cugli.net -connect 127.0.0.1:443 </dev/null 2>/dev/null | openssl x509 -outform DER | openssl sha256 -binary | base64 | tr -d '='
```
or
```
http https://federationtester.matrix.org/api/report?server_name=cugli.net
```
matrix.yml
```
tls_fingerprints: [{"sha256": "<base64_encoded_sha256_fingerprint>"}]
```

### Verify DNS SRV configuration  
```
$ host -t SRV _matrix._tcp.matrix.org
_matrix._tcp.matrix.org has SRV record 10 5 8443 matrix.org.cdn.cloudflare.net.
$ host -t SRV _matrix._tcp.cugli.net
_matrix._tcp.cugli.net has SRV record 10 0 443 matrix.cugli.net.
```

### Start Matrix Server
```
docker-compose up -d
```

### Create user account
```
docker-compose exec synapse register_new_matrix_user -c /config/matrix.yml http://localhost:8008
```
