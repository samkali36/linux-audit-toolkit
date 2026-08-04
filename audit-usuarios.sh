#!/bin/bash
# audit-usuarios.sh - Auditoría de usuarios y SSH
# Autor: samkali36

echo "===== AUDITORIA DE USUARIOS Y SSH ====="
echo "Fecha: $(date)"
echo "Hostname: $(hostname)"
echo ""

echo "[*] Usuarios con UID 0 (debería ser solo root):"
awk -F: '$3 == 0 {print $1}' /etc/passwd
echo ""

echo "[*] Usuarios sin contraseña:"
sudo awk -F: '$2 == "" {print $1}' /etc/shadow
echo ""

echo "[*] Usuarios con shell de login:"
grep -v "/nologin\|/false" /etc/passwd | cut -d: -f1,7
echo ""

echo "[*] Config SSH /etc/ssh/sshd_config:"
grep -i "^PermitRootLogin\|^PasswordAuthentication\|^PubkeyAuthentication" /etc/ssh/sshd_config 2>/dev/null | grep -v "^#"
echo ""

echo "[*] Ultimos logins:"
last -n 10
echo ""
echo "===== FIN AUDITORIA ====="
