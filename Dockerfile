FROM redis:5.0-alpine

MAINTAINER kkw0818 (kkw0818@gmail.com)

## Copy Redis File
## 복사/추가 하는파일의 Container내 경로는 항상 절대경로로 작성하여야 한다.
RUN rm -rf /usr/local/bin/docker-entrypoint.sh
ADD redis.conf /etc/redis/redis.conf
ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

## change access authority
RUN chmod 755 /etc/redis/redis.conf
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

RUN chown redis:redis /etc/redis/redis.conf
RUN chown redis:redis /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD [ "redis-server","/etc/redis/redis.conf" ]