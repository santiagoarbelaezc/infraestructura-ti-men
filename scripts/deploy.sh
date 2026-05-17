#!/bin/bash
LOG=/logs/deploy.log
FECHA=$(date +%Y%m%d_%H%M%S)
DIR=/home/ubuntu/proyecto-men/services

echo "[$FECHA] Iniciando despliegue..." >> $LOG

cd $DIR
docker compose up -d >> $LOG 2>&1

# Verificar contenedores
sleep 5
RUNNING=$(docker ps --filter "status=running" --format "{{.Names}}" | wc -l)
echo "[$FECHA] Contenedores activos: $RUNNING" >> $LOG

echo "[$FECHA] Despliegue completado" >> $LOG
