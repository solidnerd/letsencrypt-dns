Let's Encrypt DNS Challenge
===========================

## Why ?

# New Image / Container
Generally you start your letsencrpyt container and make an authentication challenge over http. 

The problem here is that the http authentication requires both standard ports from http (80/tcp) and https(443/tcp).

I couldn't managet it to use other ports for the http challenge. So in that case it requires to temporarily shutdown your loadbalancer to receive a new certificate.

Later I read on and I found out that the [ACME Spec](https://letsencrypt.github.io/acme-spec/) supports more than http authentication challenge.

So I found the interessting point. That I can resolve my authentication over dns.

Futhermore I wan't to be able to do in future and I don't want to handle all dependencies again, so I wrote this container.

### Cloudflare

Cloudflare helps to automatically generate dns entries in this case TXT Records to supoort the [DNS Authentication](https://letsencrypt.github.io/acme-spec/#dns), 
because they provide an API for managing her DNS Server.

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

## Issues or Improvements

If you have an issue make an issue on the [GitHub Repo](https://github.com/solidnerd/letsencrypt-dns).

If have any cool ideas for the repo let me know as well [GitHub Repo](https://github.com/solidnerd/letsencrypt-dns).


## Inspiration 

This repo got a lot of inspiration from the lets encrypt user guide.

- http://letsencrypt.readthedocs.io/en/latest/using.html#hooks
