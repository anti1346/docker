FROM redis:6.0.6-alpine

MAINTAINER bg (anti1346@gmail.com)

## Copy Redis File
RUN rm -rf /usr/local/bin/docker-entrypoint.sh
ADD redis.conf /usr/local/bin/redis.conf
ADD entrypoint.sh /usr/local/bin/docker-entrypoint.sh

## change access authority
RUN chmod 755 /usr/local/bin/redis.conf
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

RUN chown redis:redis /usr/local/bin/redis.conf
RUN chown redis:redis /usr/local/bin/docker-entrypoint.sh

EXPOSE $REDIS_PORT

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["redis-server", "/usr/local/bin/redis.conf"]
