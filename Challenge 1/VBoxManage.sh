

#!/bin/bash

 #Diego Armando Aguayo Alcala

# Verificar VirtualBox

if ! command -v VBoxManage &> /dev/null; then

    echo "VirtualBox no está instalado."

    exit 1

fi


# Verificar que se proporcionen los argumentos necesarios

if [ "$#" -ne 8 ]; then

    echo "Uso de comando: $0 <nombre_maquina_virtual> <tipo_so> <numero_cpus> <memoria_ram> <memoria_vram> <tamaño_disco> <nombre_controlador_sata> <nombre_controlador_ide>"

    exit 1

fi

 

# Argumentos
nombre_vm=$1
tipo_so=$2
num_cpus=$3
memoria_ram=$4
vram=$5
tamano_disco=$6
nombre_sata=$7
nombre_ide=$8

 

# Crear MV
VBoxManage createvm --name "$nombre_vm" --ostype "$tipo_so" --register


# Configurar numero de nucleos (CPUs) memoria RAM
VBoxManage modifyvm "$nombre_vm" --cpus "$num_cpus" --memory "$memoria_ram" --vram "$vram"


# Crear disco duro
VBoxManage createmedium disk --filename "$nombre_vm.vdi" --size "$tamano_disco"


# Asociar disco duro a mv
VBoxManage storagectl "$nombre_vm" --name "$nombre_sata" --add sata
VBoxManage storageattach "$nombre_vm" --storagectl "$nombre_sata" --port 0 --device 0 --type hdd --medium "$nombre_vm.vdi"

 

# Crear controlador IDE y asociar
VBoxManage storagectl "$nombre_vm" --name "$nombre_ide" --add ide
VBoxManage storageattach "$nombre_vm" --storagectl "$nombre_ide" --port 0 --device 0 --type dvddrive --medium emptydrive

 

# Mostrar configuración
echo "Configuración de la máquina virtual:"

echo "Nombre: $nombre_vm"

echo "Tipo de SO: $tipo_so"

echo "Número de CPUs: $num_cpus"

echo "Memoria RAM: $memoria_ram MB"

echo "VRAM: $vram MB"

echo "Tamaño del disco duro: $tamaño_disco MB"

echo "Controlador SATA: $n

ombre_sata"

echo "Controlador IDE: $nombre_ide"
