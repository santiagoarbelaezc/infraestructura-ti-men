#!/bin/bash
FECHA=$(date +%Y%m%d_%H%M%S)
DEST=/backups
LOG=/logs/backup.log

echo "[$FECHA] Iniciando backup..." >> $LOG

# Backup base de datos
docker exec men-db mysqldump -u root -pmen_root_2024 men_db > $DEST/db_$FECHA.sql
echo "[$FECHA] DB backup OK" >> $LOG

# Backup configs
tar -czf $DEST/configs_$FECHA.tar.gz /home/ubuntu/proyecto-men/services/
echo "[$FECHA] Configs backup OK" >> $LOG

# Rotar backups (mantener solo últimos 7)
find $DEST -name "*.sql" -mtime +7 -delete
find $DEST -name "*.tar.gz" -mtime +7 -delete

echo "[$FECHA] Backup completado" >> $LOG
