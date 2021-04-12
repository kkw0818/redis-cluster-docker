#!/bin/sh
set -e

### redis port inside redis.conf
sed -i "s/# requirepass foobared/requirepass $REQUIREPASS/g" /etc/redis/redis.conf
sed -i "s/# masterauth <master-password>/masterauth $REQUIREPASS/g" /etc/redis/redis.conf
sed -i "s/port 6379/port $CLIENTPORT/g" /etc/redis/redis.conf
sed -i "s/# cluster-enabled yes/cluster-enabled yes/g" /etc/redis/redis.conf
sed -i "s/# cluster-config-file nodes-6379.conf/cluster-config-file nodes.conf/g" /etc/redis/redis.conf
sed -i "s/# cluster-node-timeout 15000/cluster-node-timeout 5000/g" /etc/redis/redis.conf

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