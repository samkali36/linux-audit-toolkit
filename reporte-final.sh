#!/bin/bash
# reporte-final.sh - Genera reporte completo
# Autor: samkali36
# Fecha: $(date)

REPORTE="reporte-auditoria-$(date +%Y%m%d-%H%M).txt"

echo "Generando reporte completo... -> $REPORTE"

{
echo "=========================================="
echo " LINUX AUDIT TOOLKIT - REPORTE FINAL"
echo " Fecha: $(date)"
echo " Host: $(hostname)"
echo " Usuario: $(whoami)"
echo "=========================================="
echo ""
echo "--- 1. RECON BASICO ---"
./recon-basico.sh 2>/dev/null
echo ""
echo "--- 2. AUDITORIA USUARIOS ---"
./audit-usuarios.sh 2>/dev/null
echo ""
echo "--- 3. AUDITORIA PERMISOS ---"
./audit-permisos.sh 2>/dev/null
echo ""
echo "--- 4. AUDITORIA RED ---"
./audit-red.sh 2>/dev/null
} | tee "$REPORTE"

echo ""
echo "✅ Reporte guardado en: $REPORTE"
ls -lh "$REPORTE"
