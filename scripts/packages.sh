#!/bin/bash

# Name:Instalación de paquetes APT

REPOSITORIES_LIST=$(cat ${BASE_DIR}/config/repositories.cfg)
REPOSITORIES_COUNT=$(echo ${REPOSITORIES_LIST} | wc -w)

PACKAGES_LIST=$(cat ${BASE_DIR}/config/packages.cfg)
PACKAGES_COUNT=$(echo ${PACKAGES_LIST} | wc -w)

COUNT=$((${REPOSITORIES_COUNT} + ${PACKAGES_COUNT}))

message 'Actualizando paquetes instalados en el sistema'

apt_update

success_message 'Actualización de de paquetes terminada\n'

message 'Iniciando instalación de paquetes'

bar::start
for repository in ${REPOSITORIES_LIST}; do
    enable_repository ${repository}
    steps_done_repositories=$((${steps_done_repositories:-0}+1))
    bar::status_changed ${steps_done_repositories} ${COUNT}
done
for package in ${PACKAGES_LIST}; do
    install_package ${package}
    steps_done_package=$((${steps_done_package:-0}+1))
    bar::status_changed ${steps_done_package} ${COUNT}
done
bar::stop
success_message 'Instalación de de paquetes terminada\n'

message 'Eliminando paquetes obsoletos del sistema'

apt_clean

success_message 'Eliminación de paquetes obsoletos terminada\n'