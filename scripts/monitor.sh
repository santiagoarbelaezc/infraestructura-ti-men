#!/bin/bash
LOG=/logs/monitor.log
FECHA=$(date +%Y%m%d_%H%M%S)
UMBRAL_CPU=80
UMBRAL_DISCO=90

# Colores
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${CYAN}========================================${NC}" | tee -a $LOG
echo -e "${CYAN}[$FECHA] 📊 Monitoreo de Infraestructura${NC}" | tee -a $LOG
echo -e "${CYAN}========================================${NC}" | tee -a $LOG

echo -e "\n➔ ${YELLOW}Estado de Contenedores:${NC}" | tee -a $LOG
docker ps -a --format "  {{.Names}}: {{.Status}}" | tee -a $LOG

# CPU y RAM
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
RAM=$(free -m | awk 'NR==2{printf "%.0f", $3*100/$2}')
echo -e "\n➔ ${YELLOW}Rendimiento:${NC}" | tee -a $LOG
echo -e "  CPU: ${CPU}%" | tee -a $LOG
echo -e "  RAM: ${RAM}%" | tee -a $LOG

# Discos
DISCO=$(df -h / | awk 'NR==2{print $5}' | cut -d'%' -f1)
DISCO_DATA=$(df -h /data 2>/dev/null | awk 'NR==2{print $5}' | cut -d'%' -f1)
DISCO_BACKUPS=$(df -h /backups 2>/dev/null | awk 'NR==2{print $5}' | cut -d'%' -f1)

echo -e "\n➔ ${YELLOW}Almacenamiento LVM/RAID:${NC}" | tee -a $LOG
echo -e "  Raíz (/): ${DISCO}%" | tee -a $LOG
echo -e "  Datos (/data): ${DISCO_DATA:-0}%" | tee -a $LOG
echo -e "  Backups (/backups): ${DISCO_BACKUPS:-0}%" | tee -a $LOG

# Alertas
if [ "$DISCO" -gt "$UMBRAL_DISCO" ]; then
    echo -e "\n${RED}⚠️ ALERTA CRÍTICA: Disco principal al ${DISCO}%${NC}" | tee -a $LOG
fi

echo -e "\n${CYAN}[$FECHA] ✅ Monitoreo finalizado.${NC}" | tee -a $LOG
