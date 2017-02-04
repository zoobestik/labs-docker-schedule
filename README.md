# labs-docker-schedule
Docker compose for support cron tasks

- [host_docker_backup](#backup-shared-containers-data--host_docker_backup)

## Backup shared containers data – [host_docker_backup](https://github.com/zoobestik/labs-docker-schedule/blob/master/scripts/host_docker_backup.sh)
Backup data to [Ya.Disk](https://disk.yandex.ru/) with **WebDav** request.

Required enviroment variables (`.env` file):
```bash
HOST_FILE=/etc/hostdocker # hard code
GPG_PASSWD=123PASS # passcode for gpg encoing
YADISK_USER_AND_PASSWORD=user:pass # webdav login and password
```
