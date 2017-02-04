#!/bin/sh

NUM=$((( RANDOM % 3 )  + 1))
FILE_LIST="/tmp/host_backup.list"
FILE_BACKUP="/tmp/host-$NUM.tar.gz.gpg"

echo "Starting backup $(date -u -R) – $NUM..."

echo "Get backup flies list"
cd $HOST_FILE
find . -type f | grep -v -E "\/\.git(\/.+|$)" | grep -v -E '[^(\.mysql)]\.env$' | grep -v -E '^\.\.$' | grep -v 'openvpn/' > $FILE_LIST
echo "Pack and signing files"
tar cz --no-recursion --files-from "$FILE_LIST" | gpg -c -z 0 --batch --passphrase $GPG_PASSWD > $FILE_BACKUP
echo "Sending backup file to Ya.Disk"
curl --user $YADISK_USER_AND_PASSWORD -T "$FILE_BACKUP" https://webdav.yandex.ru/Backup/
echo "Clean artifacts"
rm "$FILE_LIST" "$FILE_BACKUP"

echo "Backup finished"
