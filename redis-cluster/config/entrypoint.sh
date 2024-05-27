#!/bin/sh
set -e

## from redis-5
sed -i "s/bind 127.0.0.1/bind $REDIS_HOST 127.0.0.1/g" /usr/local/bin/redis.conf
#
### redis port inside redis.conf
sed -i "s/port 6379/port $REDIS_PORT/g" /usr/local/bin/redis.conf
#sed -i "s/# requirepass foobared/requirepass $REQUIRE_PASSWORD/g" /usr/local/bin/redis.conf
#sed -i "s/# masterauth <master-password>/masterauth $REQUIRE_PASSWORD/g" /usr/local/bin/redis.conf

# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
if [ "${1#-}" != "$1" ] || [ "${1%.conf}" != "$1" ]; then
	set -- redis-server "$@"
fi

# allow the container to be started with `--user`
if [ "$1" = 'redis-server' -a "$(id -u)" = '0' ]; then
	chown -R redis .
	exec su-exec redis "$@"
fi

exec "$@"
