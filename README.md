Let's Encrypt DNS Challenge
===========================

This repo contains only an image for an letsencrpyt container to use dns challenge with cloudflare.

It uses the certbot image directly.

## How to run this ?

### With interactive mode for to decide if you want ip logging

```bash
docker run --rm  -it -v "/etc/letsencrypt:/etc/letsencrypt" \
  -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
  -v "/var/log/letsencrypt:/var/log/letsencrypt" \
  -e CERTBOT_DOMAIN=<domain> \
  -e CLOUDFLARE_API_KEY=<cloudflare api key> \
  -e CLOUDFLARE_EMAIL=<email address> \
solidnerd/letsencrpyt-dns:0.1.0
```

### Accept IP Logging 

```bash
docker run --rm -it -v "/etc/letsencrypt:/etc/letsencrypt"  \
  -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
  -v "/var/log/letsencrypt:/var/log/letsencrypt" \
  -e CERTBOT_DOMAIN=<domain> \
  -e CLOUDFLARE_API_KEY=<cloudflare api key> \
  -e CLOUDFLARE_EMAIL=<email address> \
  -e CERBOT_IP_LOGGING=true \
solidnerd/letsencrpyt-dns:0.1.0
```

## Configuration

|Variable | Description |
|:-------| :---------- |
|CERTBOT_DOMAIN| Domain that should receive a certificate |
| CLOUDFLARE_API_KEY | Global Api Key from Cloudflare |
| CLOUDFLARE_EMAIL | Email Address that is used to login in cloudflare |
| CERTBOT_IP_LOGGING | Accepts that the IP will be logged from the server that requests a certificate | 

## Issues

Make an issue on the [GitHub Repo](https://github.com/solidnerd/letsencrypt-dns) .

## Inspiration 

This repo got a lot of inspiration from the lets encrypt user guide.

- http://letsencrypt.readthedocs.io/en/latest/using.html#hooks
