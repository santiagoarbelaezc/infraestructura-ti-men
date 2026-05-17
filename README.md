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

> ### 🏛️ Portal de Infraestructura de TI — MEN
> Infraestructura de TI completa diseñada e implementada para soportar los servicios críticos del **Ministerio de Educación Nacional (MEN)** de la República de Colombia. Esta solución está estructurada bajo estándares de grado de producción para garantizar alta disponibilidad (HA), seguridad en capas y almacenamiento redundante de los datos educativos nacionales.

---

## ✨ Componentes Implementados

<table>
  <thead>
    <tr>
      <th colspan="2" align="center">🛠️ ARQUITECTURA DE INFRAESTRUCTURA</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td width="50%">
        <h4>🌐 Red Segmentada</h4>
        <p>4 subredes Docker independientes por tipo de servicio para mitigar amenazas y aislar el tráfico de datos de cada capa.</p>
        <code>red-web</code> · <code>red-db</code> · <code>red-admin</code> · <code>red-archivos</code>
      </td>
      <td width="50%">
        <h4>📦 Servicios Containerizados</h4>
        <p>Servicios modulares desplegados mediante imágenes oficiales de Docker para portabilidad y fácil mantenimiento.</p>
        <code>Nginx</code> · <code>MySQL 8.0</code> · <code>OpenSSH</code> · <code>NTP</code> · <code>NFS</code>
      </td>
    </tr>
    <tr>
      <td>
        <h4>💾 Almacenamiento Redundante</h4>
        <p>Redundancia física mediante espejo RAID 1 con <code>mdadm</code> más administración lógica y flexible con <code>LVM</code>.</p>
        <code>sda / sdb</code> &rarr; <code>md0</code> &rarr; <code>Logical Volumes</code>
      </td>
      <td>
        <h4>🛡️ Seguridad en Capas</h4>
        <p>Políticas activas con firewall <code>UFW</code>, autenticación SSH por llave pública, permisos SETUID/SETGID restrictivos y segregación de usuarios.</p>
        <code>UFW</code> · <code>SSH RSA 4096</code> · <code>Sticky Bit</code>
      </td>
    </tr>
    <tr>
      <td>
        <h4>🤖 Automatización con Bash</h4>
        <p>Scripts modulares integrados en <code>cron</code> para backups automáticos, monitoreo continuo de recursos y alertas de disco.</p>
        <code>backup.sh</code> · <code>monitor.sh</code> · <code>deploy.sh</code>
      </td>
      <td>
        <h4>⚡ Balanceo & Alta Disponibilidad</h4>
        <p>Distribución de tráfico web con proxy reverso Nginx configurado con upstream balanceado para soportar fallos (failover).</p>
        <code>Nginx Upstream</code> · <code>Active Failover</code>
      </td>
    </tr>
  </tbody>
</table>

---

## 🔧 Stack Tecnológico

<table>
  <thead>
    <tr>
      <th align="center">Tecnología</th>
      <th>Capa / Rol en la Arquitectura</th>
      <th>Detalle del Componente</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center"><img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" /></td>
      <td><strong>Virtualización & Redes</strong></td>
      <td>Orquestación de servicios aislados y subredes bridge personalizadas.</td>
    </tr>
    <tr>
      <td align="center"><img src="https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white" /></td>
      <td><strong>Servidor Web & Proxy</strong></td>
      <td>Entrada al portal MEN y balanceador de carga redundante de cara al exterior.</td>
    </tr>
    <tr>
      <td align="center"><img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" /></td>
      <td><strong>Persistencia de Datos</strong></td>
      <td>Motor de base de datos relacional mysql:8.0 seguro para almacenamiento persistente.</td>
    </tr>
    <tr>
      <td align="center"><img src="https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white" /></td>
      <td><strong>Sistema Operativo Host</strong></td>
      <td>Plataforma base de servidor de producción Ubuntu 26.04 LTS.</td>
    </tr>
    <tr>
      <td align="center"><img src="https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white" /></td>
      <td><strong>Automatización Scripts</strong></td>
      <td>Rutinas automatizadas mediante scripts de monitoreo, copias de seguridad y despliegue.</td>
    </tr>
  </tbody>
</table>

---

## 🗺️ Arquitectura de Red

<table>
  <thead>
    <tr>
      <th>Red / VLAN</th>
      <th>Segmento IP</th>
      <th>IP Gateway</th>
      <th>Servicio / Contenedor</th>
      <th>IP Estática</th>
      <th>Protocolo y Puerto</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>red-web</code></td>
      <td><code>172.20.1.0/24</code></td>
      <td><code>172.20.1.1</code></td>
      <td><strong>men-web</strong> (Nginx Server)</td>
      <td><code>172.20.1.10</code></td>
      <td><code>80/tcp</code> (HTTP)</td>
    </tr>
    <tr>
      <td><code>red-db</code></td>
      <td><code>172.20.2.0/24</code></td>
      <td><code>172.20.2.1</code></td>
      <td><strong>men-db</strong> (MySQL Engine)</td>
      <td><code>172.20.2.10</code></td>
      <td><code>3306/tcp</code> (MySQL)</td>
    </tr>
    <tr>
      <td rowspan="2"><code>red-admin</code></td>
      <td rowspan="2"><code>172.20.3.0/24</code></td>
      <td rowspan="2"><code>172.20.3.1</code></td>
      <td><strong>men-ssh</strong> (SSH Server Admin)</td>
      <td><code>172.20.3.10</code></td>
      <td><code>2222/tcp</code> (SSH)</td>
    </tr>
    <tr>
      <td><strong>men-ntp</strong> (NTP Daemon)</td>
      <td><code>172.20.3.11</code></td>
      <td><code>123/udp</code> (NTP)</td>
    </tr>
    <tr>
      <td><code>red-archivos</code></td>
      <td><code>172.20.4.0/24</code></td>
      <td><code>172.20.4.1</code></td>
      <td><strong>men-nfs</strong> (NFS Server)</td>
      <td><code>172.20.4.10</code></td>
      <td><code>2049/tcp</code> (NFS)</td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> **Aislamiento Estratégico de Redes**:
> Siguiendo el principio de mínimo privilegio, los contenedores están segregados de forma que el servidor de cara al público (`men-web`) está aislado físicamente y no tiene rutas de comunicación directa hacia la base de datos (`men-db`). Esto mitiga y restringe drásticamente el impacto de cualquier brecha de seguridad.

---

## 📁 Estructura del Repositorio

```text
proyecto-men/
├── 📁 network/          # Diseño, direccionamiento IP e informe de topología
├── 📁 services/         # Despliegue de servicios y configuraciones
│   ├── 📄 docker-compose.yml
│   ├── 📁 web/          # Código del portal MEN y archivos de configuración Nginx
│   └── 📁 db/           # Inicializadores SQL y esquemas de base de datos
├── 📁 scripts/          # Rutinas de automatización técnica
│   ├── ⚙️ backup.sh
│   ├── ⚙️ monitor.sh
│   └── ⚙️ deploy.sh
├── 📁 docs/             # Documentación de infraestructura y rúbrica
└── 📁 backups/          # Respaldos automatizados del sistema
```

---

## 🚀 Levantar la Infraestructura

### 🛠️ Pasos de Despliegue Técnico

1. **Clonar e ingresar al repositorio**:
   ```bash
   git clone https://github.com/santiagoarbelaezc/infraestructura-ti-men.git
   cd infraestructura-ti-men
   ```

2. **Acceder al directorio de servicios**:
   ```bash
   cd services
   ```

3. **Desplegar los contenedores en segundo plano**:
   ```bash
   docker compose up -d
   ```

4. **Monitorear el estado de los servicios**:
   ```bash
   docker compose ps
   ```

> [!IMPORTANT]
> **Configuración de Red de la VM**:
> Para acceder al portal del MEN en el navegador web de su equipo principal, recuerde configurar los adaptadores en la máquina virtual: Adaptador 1 tipo **NAT** (acceso a internet) y Adaptador 2 tipo **Host-Only** con la IP estática asignada `192.168.56.10`.

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
