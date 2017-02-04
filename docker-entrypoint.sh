#!/bin/bash

if [[ -n "${CLOUDFLARE_API_KEY}"  &&  -n "${CLOUDFLARE_EMAIL}" && -n "${CERTBOT_DOMAIN}" ]]; then
  if [[ $CERBOT_IP_LOGGING == true ]]; then
    exec certbot certonly --manual --preferred-challenges=dns --manual-public-ip-logging-ok  --manual-auth-hook authenticator.sh --manual-cleanup-hook  cleanup.sh -d ${CERTBOT_DOMAIN}
  else
    exec certbot certonly --manual --preferred-challenges=dns --manual-auth-hook authenticator.sh --manual-cleanup-hook  cleanup.sh -d ${CERTBOT_DOMAIN}
  fi
else 
echo "One of the following variables were not set: "
echo "CLOUDFLARE_API_KEY"
echo "CLOUDFLARE_EMAIL"
echo "CERTBOT_DOMAIN"
exit 1
fi


