#!/bin/bash

echo "QMK - Compile"
qmk compile

echo "Generate keymap layout YAML"
qmk c2json keymap.c --no-cpp | keymap parse -c 10 -q - >keymap_layout.yaml

echo "Draw keymap layout SVG"
keymap draw keymap_layout.yaml -s L1 >keymap_layout.svg

echo "Convert SVG to PNG"
inkscape keymap_layout.svg \
  --export-type=png \
  --export-filename=/Users/albert.rovira/qmk_firmware/keyboards/ferris/keymaps/AlbertRF147/keymap_layout.png \
  --export-dpi=192

echo "Reload Hammerspoon config"
hs -c "hs.reload()"
