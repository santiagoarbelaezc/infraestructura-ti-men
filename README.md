<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:003087,100:1A5276&height=120&section=header&animation=fadeIn" />
</div>

<h1 align="center">🏛️ Infraestructura TI — Ministerio de Educación Nacional</h1>

<h3 align="center">🚀 Infraestructura funcional, segura y escalable para el MEN de Colombia</h3>

<p align="center">
  Proyecto Final — Administración de Infraestructura TI<br>
  Implementado en Ubuntu 26.04 LTS con Docker, RAID 1, LVM, seguridad y automatización Bash.
</p>

---

## 📋 Descripción del Proyecto

Infraestructura TI completa para el **Ministerio de Educación Nacional (MEN)** de Colombia, diseñada para soportar servicios críticos con alta disponibilidad, seguridad en capas y almacenamiento redundante.

---

## ✨ Componentes Implementados

- **Red segmentada:** 4 subredes Docker independientes por tipo de servicio
- **Servicios en contenedores:** Web (Nginx), Base de datos (MySQL), SSH, NTP y NFS
- **Almacenamiento redundante:** RAID 1 con mdadm + LVM (3 volúmenes lógicos)
- **Seguridad:** Firewall UFW, usuarios con roles, SETUID/SETGID/Sticky bit, SSH por llave pública
- **Automatización:** Scripts Bash para backup, monitoreo y despliegue con cron
- **Alta disponibilidad:** Balanceo de carga Nginx con failover automático

---

## 🔧 Stack Tecnológico

<div align="center">
  <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" />
  <img width="8" />
  <img src="https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white" />
  <img width="8" />
  <img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" />
  <img width="8" />
  <img src="https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white" />
  <img width="8" />
  <img src="https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white" />
</div>

---

## 🗺️ Arquitectura de Red

| Red | Subred | Servicio |
|-----|--------|----------|
| red-web | 172.20.1.0/24 | Nginx (Web MEN) |
| red-db | 172.20.2.0/24 | MySQL 8.0 |
| red-admin | 172.20.3.0/24 | SSH + NTP |
| red-archivos | 172.20.4.0/24 | NFS |

---

## 📁 Estructura del Repositorio

```text
proyecto-men/
├── network/          # Diagramas y diseño de red
├── services/         # Docker Compose y configuraciones
│   ├── docker-compose.yml
│   ├── web/          # nginx.conf + index.html (portal MEN)
│   └── db/           # init.sql (esquema men_db)
├── scripts/          # Automatización Bash
│   ├── backup.sh
│   ├── monitor.sh
│   └── deploy.sh
├── docs/             # Documentación técnica
└── backups/          # Respaldos del sistema
```

---

## 🚀 Levantar la Infraestructura

```bash
cd services
docker compose up -d
docker compose ps
```

---

## 👨‍💻 Desarrolladores

<div align="center">

### Santiago Arbelaez Contreras
Estudiante de Ingeniería de Sistemas

<a href="https://github.com/santiagoarbelaezc"><img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" /></a>

---

### Yorgen Sebastian Marin
Estudiante de Ingeniería de Sistemas

</div>

---

<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:1A5276,100:003087&height=90&section=footer&animation=fadeIn" />
  <p>© 2026 Proyecto Final — Administración de Infraestructura TI</p>
</div>
