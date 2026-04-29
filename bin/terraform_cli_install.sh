#!/usr/bin/env bash

# Actualizar el sistema e instalar dependencias
sudo apt-get update
sudo apt-get install -y gnupg software-properties-common curl

# Descargar y registrar la clave GPG de HashiCorp
curl -fsSL https://apt.releases.hashicorp.com/gpg | \
sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Verificar la huella digital de la clave (opcional pero recomendado)
gpg --no-default-keyring \
  --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
  --fingerprint

# Agregar el repositorio oficial de HashiCorp
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

# Actualizar repositorios e instalar Terraform
sudo apt-get update
sudo apt-get install -y terraform

# Verificar la instalación
terraform version