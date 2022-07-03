# Certbot
Certbot Docker container that request certificates for domains resolved by [Cloudflare DNS](https://www.cloudflare.com/dns/).

## Credentials
You can choose between the restricted API token or global API key to authenticate with Cloudflare. Credentials are stored in `cloudflare.ini` in the following format. The API token method is more restricted and therefore more recommended. More documentation can be found [here](https://certbot-dns-cloudflare.readthedocs.io/en/stable/#credentials).

API token (recommended):
```ini
dns_cloudflare_api_token=<TOKEN>
```

API key:
```ini
dns_cloudflare_email=<EMAIL>
dns_cloudflare_api_key=<KEY>
```

## Examples

### Request certificate
```shell
docker-compose run --rm certbot certonly --dns-cloudflare --dns-cloudflare-credentials /cloudflare.ini -d example.com
```

### Renew all certificates
```shell
docker-compose run --rm certbot renew
```

### Delete certificate
```shell
docker-compose run --rm certbot delete --cert-name example.com
```
