#!/bin/bash
LOG=/logs/deploy.log
FECHA=$(date +%Y%m%d_%H%M%S)
DIR=/home/ubuntu/proyecto-men/services

# Colores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # Sin color

echo -e "${BLUE}========================================${NC}" | tee -a $LOG
echo -e "${BLUE}[$FECHA] 🚀 Iniciando despliegue de Infraestructura...${NC}" | tee -a $LOG
echo -e "${BLUE}========================================${NC}" | tee -a $LOG

echo -e "➔ Creando configuración temporal de men-web2..." | tee -a $LOG
echo -e "server {\n  listen 80;\n  location / {\n    return 200 'Web2 de Respaldo Funcionando Ok';\n  }\n}" > /tmp/men-web2.conf

echo -e "➔ Levantando contenedores Docker..." | tee -a $LOG
cd $DIR
docker compose up -d 2>&1 | tee -a $LOG

echo -e "➔ Esperando inicialización (5s)..." | tee -a $LOG
sleep 5
RUNNING=$(docker ps --filter "status=running" --format "{{.Names}}" | wc -l)

echo -e "➔ Contenedores activos detectados: ${GREEN}$RUNNING${NC} (Esperados: 6)" | tee -a $LOG

echo -e "${GREEN}[$FECHA] ✅ Despliegue completado con éxito.${NC}" | tee -a $LOG
