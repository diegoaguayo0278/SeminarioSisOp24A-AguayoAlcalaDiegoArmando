#!/bin/bash

#Diego Armando Aguayo Alcala
listar_contenido() {
    read -p "Ruta absoluta al fichero: " ruta
    ls -l "$ruta"
}

#Crear y escribir archivo de texto
crear_archivo() {
    read -p "Ingrese el texto a almacenar: " texto
    echo "$texto" > texto.txt
    echo "Archivo creado exitosamente."
}

#Comparar
comparar_archivos() {
    read -p "Ingrese la ruta al primer archivo: " archivo1
    read -p "Ingrese la ruta al segundo archivo: " archivo2
    diff "$archivo1" "$archivo2"
}

#Mostrar el uso de awk
uso_awk() {
    echo "Ejemplo de uso de awk:"
    echo "Listar todos los usuarios del sistema:"
    awk -F':' '{ print $1 }' /etc/passwd
}

#Mostrar el uso de grep
uso_grep() {
    echo "Ejemplo de uso de grep:"
    echo "Buscar todas las líneas que contienen la palabra 'error' en un archivo de registro:"
    grep "error" /var/log/syslog
}

#Menu Princial
menu_principal() {
    clear
    echo "### MENU DE SERVICIOS ###"
    echo "1. Listar contenido de un archivo o carpeta"
    echo "2. Crear un archivo de texto con una línea de texto"
    echo "3. Comparar dos archivos de texto"
    echo "4. Mostrar uso de AWK"
    echo "5. Mostrar uso de GREP"
    echo "6. Salir"

    read -p "Seleccione una opción (1-6): " opcion

    case $opcion in
        1) listar_contenido ;;
        2) crear_archivo ;;
        3) comparar_archivos ;;
        4) uso_awk ;;
        5) uso_grep ;;
        6) echo "Saliendo del programa."; exit ;;
        *) echo "Opción inválida. Por favor, seleccione una opción válida." ;;
    esac

    read -n 1 -s -r -p "Presione cualquier tecla para continuar"
    menu_principal
}

# Llamar a la función principal
menu_principal
