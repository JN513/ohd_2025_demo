#!/bin/bash

# Verifica se o Yosys e netlistsvg estão instalados
if ! command -v yosys &> /dev/null; then
    echo "Erro: Yosys não está instalado. Instale com 'sudo apt install yosys' (Linux)."
    exit 1
fi

if ! command -v netlistsvg &> /dev/null; then
    echo "Erro: netlistsvg não está instalado. Instale com 'npm install -g netlistsvg'."
    exit 1
fi

# Verifica se um arquivo .v foi passado
if [ -z "$1" ]; then
    echo "Uso: $0 <arquivo_verilog.v> [modulo_principal]"
    exit 1
fi

INPUT_FILE="$1"
TOP_MODULE="${2:-top}"  # Nome do módulo top (padrão: 'top')
JSON_FILE="circuito.json"
OUTPUT_SVG="circuito.svg"
OUTPUT_PNG="circuito.png"

# Executa Yosys para gerar o JSON
yosys -p "read_verilog -sv $INPUT_FILE; synth -top $TOP_MODULE; write_json $JSON_FILE" || exit 1

# Converte JSON para SVG
netlistsvg "$JSON_FILE" -o "$OUTPUT_SVG" || exit 1

# Converte SVG para PNG (requer ImageMagick ou Inkscape)
if command -v convert &> /dev/null; then
    convert "$OUTPUT_SVG" "$OUTPUT_PNG"
    echo "PNG gerado: $OUTPUT_PNG"
elif command -v inkscape &> /dev/null; then
    inkscape "$OUTPUT_SVG" -o "$OUTPUT_PNG"
    echo "PNG gerado: $OUTPUT_PNG"
else
    echo "Aviso: Instale 'convert' (ImageMagick) ou 'inkscape' para gerar PNG. SVG salvo em $OUTPUT_SVG."
fi

# Remove o JSON temporário (opcional)
rm -f "$JSON_FILE"
