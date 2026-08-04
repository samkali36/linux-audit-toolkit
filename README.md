# Linux Audit Toolkit 🛡️
Toolkit ligero de auditoría para Linux hecho en Bash. Ideal para sysadmins y pentesters que quieren checar rápido la postura de seguridad de un servidor.

## 🚀 Scripts incluidos

### 1. recon-basico.sh ✅
Recolecta info del sistema: usuario, hostname, IP, SO, espacio en disco.

### 2. audit-usuarios.sh ✅
Audita usuarios con UID 0, shells de login y configuración básica de SSH.
### 3. audit-permisos.sh ✅
Busca binarios SUID y archivos world-writable que pueden usarse para escalar privilegios.
## 🛣️ Roadmap
- [x] recon-basico.sh
- [x] audit-usuarios.sh
- [x] audit-permisos.sh (archivos SUID, /tmp world-writable)
- [ ] audit-red.sh (puertos abiertos, reglas firewall)
- [ ] Generar reporte final en.txt

## 👨‍💻 Autor
Sam Esparza - Técnico en Ciberseguridad
GitHub: @samkali36
