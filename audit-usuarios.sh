#!/bin/bash
# audit-usuarios.sh - Auditoría de usuarios y SSH v2
# Autor: samkali36

echo "===== AUDITORIA DE USUARIOS Y SSH ====="
echo "Fecha: $(date)"
echo "Hostname: $(hostname)"
echo ""

echo "[*] Usuarios con UID 0 (deberia ser solo root):"
awk -F: '$3 == 0 {print $1}' /etc/passwd
echo ""

echo "[*] Usuarios con shell de login:"
grep -v "/nologin\|/false" /etc/passwd | cut -d: -f1,7
echo ""

echo "[*] Config SSH /etc/ssh/sshd_config:"
if [ -f /etc/ssh/sshd_config ]; then
  sudo grep -i "^PermitRootLogin\|^PasswordAuthentication" /etc/ssh/sshd_config 2>/dev/null
else
  echo "No se encontro sshd_config"
fi
echo ""

echo "[*] Ultimos logins (who):"
who
echo ""
echo "===== FIN AUDITORIA ====="
