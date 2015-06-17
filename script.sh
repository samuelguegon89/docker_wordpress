#!/bin/bash

#Iniciamos el servicio mysql

/etc/init.d/mysql start

#Guardamos en variables los datos de la base de datos

DB_ROOT="root"
DB_ROOT_PASS="root"
DB_NAME="wordpress"
DB_USER="wordpress"
DB_PASS="wordpress"

#Nos conectamos a la BBDD como root y creamos el usuario sql

mysql -u ${DB_ROOT} -p${DB_ROOT_PASS} -e "CREATE USER '${DB_USER}';"

#Creamos la base de datos

mysql -u ${DB_ROOT} -p${DB_ROOT_PASS} -e "CREATE DATABASE ${DB_NAME};"

#Le damos permisos al usuario sobre la base de datos y le ponemos contraseña

mysql -u ${DB_ROOT} -p${DB_ROOT_PASS} -e "GRANT ALL ON ${DB_NAME}.* TO ${DB_USER} IDENTIFIED BY '${DB_PASS}';"

#Reiniciamos los servicios

/etc/init.d/apache2 start

/bin/bash


