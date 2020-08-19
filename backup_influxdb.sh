#!/bin/bash

# Cronjob
# 30 3 * * * /home/pi/home-assistant-pi/backup_influxdb.sh >> /dev/null 2>&1

DOCKER="/usr/bin/docker"
DOCKER_ID=$(/usr/bin/docker ps -aqf "name=influxdb")
PATH="/home/pi/home-assistant-pi/influxdb"
DOCKER_PATH="/var/lib/influxdb"
BACKUP_DIR="$PATH/backup/"
DOCKER_BACKUP_DIR="$DOCKER_PATH/backup/"
ARCHIVE_DIR="$PATH/archive"
DOCKER_ARCHIVE_DIR="$DOCKER_PATH/archive"
DATETIME=`/bin/date +"%Y%m%d"`
MKDIR="/bin/mkdir"

echo "--- InfluxDB backup ---"

# Ensure we have the backup and archive directories
if ! [ -d $BACKUP_DIR ] ; then
  $MKDIR $BACKUP_DIR ;
fi ;
if ! [ -d $ARCHIVE_DIR ] ; then
  $MKDIR $ARCHIVE_DIR ;
fi ;

# backup influxdb
${DOCKER} exec -i ${DOCKER_ID} /bin/bash -c "cd ${DOCKER_BACKUP_DIR}; rm ${DOCKER_BACKUP_DIR}*; /usr/bin/influxd backup -portable -database home_assistant ."

# archive backup
${DOCKER} exec -i ${DOCKER_ID} /bin/bash -c "cd ${DOCKER_BACKUP_DIR}; ls -alrt; /bin/tar -cvf ${DOCKER_ARCHIVE_DIR}/influxdb-${DATETIME}.tar ."

# keep 5 latest archives
${DOCKER} exec -i ${DOCKER_ID} /bin/bash -c "cd ${DOCKER_ARCHIVE_DIR}; ls -tp | grep -v '/$' | tail -n +6 | xargs -d '\n' -r rm --"

echo "--- done ---"

# RESTORE
# extract tar file in /var/lib/influxdb/backup
# influxd restore -portable -db home_assistant /var/lib/influxdb/backup
