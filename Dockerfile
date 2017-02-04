FROM alpine:latest

RUN apk add --update --no-cache tar curl gnupg
RUN rm -rf /var/cache/apk/*

RUN gpg --batch --gen-key
COPY scripts/ /etc/periodic/
COPY services.jobs /var/spool/cron/crontabs/root

RUN chmod -R +x /etc/periodic/ /var/spool/cron/crontabs/

CMD ["crond", "-f", "-d", "8"]

