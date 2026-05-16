# Diseño de Red - Ministerio de Educación Nacional

## Topología
Red segmentada en 4 subredes simuladas dentro de la VM

## Tabla de direccionamiento IP

| Subred       | Red            | Rango útil              | Servicio        |
|--------------|----------------|-------------------------|-----------------|
| Web          | 172.20.1.0/24  | 172.20.1.10 - .50       | Nginx           |
| Base de datos| 172.20.2.0/24  | 172.20.2.10 - .50       | MySQL           |
| Administración| 172.20.3.0/24 | 172.20.3.10 - .50       | SSH, NTP        |
| Archivos     | 172.20.4.0/24  | 172.20.4.10 - .50       | NFS/Samba       |

## Roles de servidores

| IP            | Hostname       | Servicio                |
|---------------|----------------|-------------------------|
| 172.20.1.10   | web-server     | Nginx (Apache)          |
| 172.20.2.10   | db-server      | MySQL                   |
| 172.20.3.10   | admin-server   | SSH, NTP                |
| 172.20.4.10   | files-server   | NFS                     |
