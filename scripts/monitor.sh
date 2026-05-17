#!/bin/bash
LOG=/logs/monitor.log
FECHA=$(date +%Y%m%d_%H%M%S)
UMBRAL_CPU=80
UMBRAL_DISCO=90

echo "[$FECHA] === Monitoreo ===" >> $LOG

# Estado contenedores
echo "[$FECHA] Contenedores:" >> $LOG
docker ps --format "{{.Names}}: {{.Status}}" >> $LOG

# CPU
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
echo "[$FECHA] CPU: $CPU%" >> $LOG

# RAM
RAM=$(free -m | awk 'NR==2{printf "%.0f", $3*100/$2}')
echo "[$FECHA] RAM: $RAM%" >> $LOG

# Disco
DISCO=$(df -h / | awk 'NR==2{print $5}' | cut -d'%' -f1)
echo "[$FECHA] Disco /: $DISCO%" >> $LOG

# Alerta disco
if [ "$DISCO" -gt "$UMBRAL_DISCO" ]; then
    echo "[$FECHA] ALERTA: Disco al $DISCO%" >> $LOG
fi

echo "[$FECHA] === Fin ===" >> $LOG
