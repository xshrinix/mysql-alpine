FROM alpine:3.19

WORKDIR /data

COPY startup.sh /startup.sh

RUN apk add --no-cache bash mysql mysql-client \
    && rm -rf /var/cache/apk/*

COPY my.cnf /etc/mysql/my.cnf

EXPOSE 3306

RUN chmod +x /startup.sh

CMD ["./startup.sh"]
