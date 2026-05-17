# Infraestructura TI — Ministerio de Educacion Nacional (MEN)

Proyecto Final — Administracion de Infraestructura TI

## Descripcion
Infraestructura TI completa para el MEN implementada en Ubuntu 26.04 LTS con Docker, RAID 1, LVM, seguridad y automatizacion Bash.

## Servicios
- **Web**: Nginx (172.20.1.10) con balanceo de carga
- **Base de datos**: MySQL 8.0 (172.20.2.10)
- **SSH**: OpenSSH Server (172.20.3.10:2222)
- **NTP**: Sincronizacion de tiempo (172.20.3.11)
- **NFS**: Servidor de archivos (172.20.4.10)

## Estructura
- `network/` — Diagramas y diseno de red
- `services/` — Docker Compose y configuraciones
- `scripts/` — Backup, monitoreo y despliegue
- `docs/` — Documentacion tecnica
- `backups/` — Respaldos del sistema

## Levantar servicios
```bash
cd services && docker compose up -d
```
