#!/bin/bash
# audit-red.sh - Auditoria de red y firewall
# Autor: samkali36

echo "===== AUDITORIA DE RED ====="
echo "Fecha: $(date)"
echo ""

echo "[*] Interfaces y IPs:"
ip -brief addr show
echo ""

echo "[*] Puertos escuchando (LISTEN):"
ss -tuln | grep LISTEN
echo ""

echo "[*] Conexiones establecidas:"
ss -tunap | grep ESTAB | head -n 10
echo ""

echo "[*] Reglas de firewall:"

if command -v ufw &>/dev/null; then
    echo "-- UFW status --"
    sudo ufw status 2>/dev/null || ufw status
fi

if command -v iptables &>/dev/null; then
    echo "-- IPTables (primeras 20 reglas) --"
    sudo iptables -L -n --line-numbers 2>/dev/null | head -n 20
fi

if systemctl is-active firewalld &>/dev/null; then
    echo "-- FirewallD --"
    sudo firewall-cmd --list-all 2>/dev/null
fi

echo ""
echo "===== FIN AUDITORIA RED ====="
