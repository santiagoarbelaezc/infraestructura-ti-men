#!/bin/bash
FECHA=$(date +%Y%m%d_%H%M%S)
DEST=/backups
LOG=/logs/backup.log

# Colores
MAGENTA='\033[0;35m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${MAGENTA}========================================${NC}" | tee -a $LOG
echo -e "${MAGENTA}[$FECHA] 💾 Iniciando Backup Automático${NC}" | tee -a $LOG
echo -e "${MAGENTA}========================================${NC}" | tee -a $LOG

echo -e "➔ Exportando base de datos MySQL..." | tee -a $LOG
docker exec men-db mysqldump -u root -pmen_root_2024 men_db > $DEST/db_$FECHA.sql 2>/dev/null
echo -e "  ${GREEN}✓ DB backup guardado: db_$FECHA.sql${NC}" | tee -a $LOG

echo -e "➔ Empaquetando archivos de configuración..." | tee -a $LOG
tar -czf $DEST/configs_$FECHA.tar.gz /home/ubuntu/proyecto-men/services/ /tmp/men-web2.conf 2>/dev/null
echo -e "  ${GREEN}✓ Config backup guardado: configs_$FECHA.tar.gz${NC}" | tee -a $LOG

echo -e "➔ Ejecutando rotación (borrando backups de +7 días)..." | tee -a $LOG
find $DEST -name "*.sql" -mtime +7 -delete
find $DEST -name "*.tar.gz" -mtime +7 -delete
echo -e "  ${GREEN}✓ Rotación completada${NC}" | tee -a $LOG

echo -e "${GREEN}[$FECHA] ✅ Backup completado con éxito.${NC}" | tee -a $LOG
