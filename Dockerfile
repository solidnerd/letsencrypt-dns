FROM  quay.io/letsencrypt/letsencrypt:v0.11.1

COPY letsencrypt-hooks/* /letsencrypt/hooks/
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN apt-get update && apt-get install -y curl && \
  chmod +x /letsencrypt/hooks/authenticator.sh \
  /letsencrypt/hooks/cleanup.sh \
  /docker-entrypoint.sh  && \
   apt-get clean && \
   rm -rf /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/*

ENV PATH="$PATH:/letsencrypt/hooks"

ENTRYPOINT ["/docker-entrypoint.sh"]

VOLUME ["/etc/letsencrypt","/var/lib/letsencrypt","/var/log/letsencrypt"]