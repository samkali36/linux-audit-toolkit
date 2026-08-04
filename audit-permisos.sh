#!/bin/bash
# audit-permisos.sh - Busca permisos peligrosos
# Autor: samkali36

echo "===== AUDITORIA DE PERMISOS PELIGROSOS ====="
echo "Fecha: $(date)"
echo ""

echo "[*] Archivos SUID (pueden escalar privilegios):"
find / -type f -perm -4000 2>/dev/null | head -n 20
echo ""

echo "[*] Archivos world-writable (cualquiera puede escribir):"
find / -type f -perm -002 2>/dev/null | grep -v proc | head -n 20
echo ""

echo "[*] Directorios en /tmp con permisos raros:"
ls -ld /tmp /var/tmp 2>/dev/null
echo ""

echo "===== FIN AUDITORIA PERMISOS ====="
