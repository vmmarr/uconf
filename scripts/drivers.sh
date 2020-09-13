#!/bin/bash

# Name:Drivers FN key Logitech K290

SRC_DIR="${BASE_DIR}/drivers/k290-fnkeyctl/"

message 'Intsalación de controladores para teclado Logitech K290'
execute "$(cd ${SRC_DIR} && sudo ./build.sh)" "Compilando drivers FN key Logitech K290, espere ..." "Error al compilar los drivers FN key Logitech K290"
execute "$(cd ${SRC_DIR} && sudo ./install.sh)" "Instalando drivers FN key Logitech K290, espere ..." "Error al instalar los drivers FN key Logitech K290"
success_message 'Instalación de controladores para teclado Logitech K290 terminada\n'
