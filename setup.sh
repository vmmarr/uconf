#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Constante de directorio raiź del script.
readonly __DIR__=$(dirname "$(readlink -f "$0")")

# Importación de comprobación de parámetros.
source "${__DIR__}/lib/args.sh"

# Importación de parámetros globales.
source "${__DIR__}/lib/params.sh"
echo ${yes}
# Comprobación de parámetros
check_param $1
check_param $2
check_param $3

# Importación de librería auxiliar.
source "${__DIR__}/lib/helper.sh"

# Elimina el fichero log de la instalación anterior.
clear_log

# Mensaje de bienvenida.
information_message "\nConfiguración personal de ${OS_VERSION}"

# Mensaje de espera de carga de recursos externos.
message "Inicializando la configuración, espere ...\n"

# Carga de recursos externos.
source "${__DIR__}/lib/autoload.sh"

# Comprueba si el script se está ejecutando desde el directorio base.
check_directory

# Actualiza los módulos integrados en el script
git_module_update

function init()
##
#   Inicializa la ejecución de los scripts
{
    for script in ${SCRIPTS}; do
        yes_no_message "source ${__DIR__}/scripts/${script}.sh" "¿Desea ejecutar el script $(script_name ${__DIR__}/scripts/${script}.sh)? (S/n): "
    done
}

#   Inicializa la ejecución de los scripts
init