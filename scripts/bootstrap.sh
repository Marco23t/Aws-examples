#!/usr/bin/env bash
set -e

echo "🔧 Inicializando entorno AWS..."

# Versions
aws --version
terraform --version
node --version
python --version

# AWS CDK
if ! command -v cdk &> /dev/null; then
  echo "Instalando AWS CDK..."
  npm install -g aws-cdk
fi

cdk --version

# SDK Python
pip install --upgrade pip boto3 awscli

# Infra init (si existe)
if [ -d "infra/terraform" ]; then
  echo "Inicializando Terraform..."
  cd infra/terraform
  terraform init || true
  cd -
fi

if [ -d "infra/cdk" ]; then
  echo "Instalando dependencias CDK..."
  cd infra/cdk
  npm install || true
  cd -
fi

echo "✅ Entorno AWS listo"
