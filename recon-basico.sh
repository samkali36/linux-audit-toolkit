#!/bin/bash
# recon-basico.sh - inventario rápido de server con permiso
# Autor: Sam Esparza - Uso ético / auditoría autorizada

echo "[+] Host: $(hostname)"
echo "[+] IP: $(ip -4 addr show | grep inet | grep -v 127.0.0.1 | awk '{print $2}')"
echo ""
echo "[+] Usuarios conectados:"
w
echo ""
echo "[+] Puertos abiertos:"
ss -tuln
echo ""
echo "[+] Espacio en disco:"
df -h | head -20
echo ""
echo "[+] Últimos logins:"
last -n 10
