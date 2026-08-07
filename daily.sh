#!/bin/bash
FECHA=$(date +%Y-%m-%d)
HORA=$(date +%H-%M)
DIR=~/github/linux-audit-toolkit/reportes/$FECHA
mkdir -p $DIR/evidencias
echo "[*] $FECHA $HORA - $HOSTNAME" | tee $DIR/evidencias/info.txt
ip a | grep inet | tee $DIR/evidencias/ip.txt
ss -tulnp | tee $DIR/evidencias/puertos.txt
find / -perm -4000 2>/dev/null | head -20 | tee $DIR/evidencias/suid.txt
echo "[+] Reporte guardado en $DIR - Listo para IA"
