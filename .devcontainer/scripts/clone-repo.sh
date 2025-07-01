#!/bin/bash
set -e

# === Configuração ===
# Troque pelo seu Personal Access Token (ou use secrets)
# Exemplo usando variável de ambiente (mais seguro)
if [ -z "$AZDO_PAT" ]; then
  echo "❌ Erro: a variável AZDO_PAT não está definida."
  echo "Use 'gh codespace secrets set AZDO_PAT --repos=SEU_USUARIO/SEU_REPO' para definir."
  exit 1
fi

# URL com autenticação via token
AZDO_REPO_URL="https://$AZDO_PAT@dev.azure.com/wildici0429/SPFX-CICD/_git/spfx-codespace"
TARGET_DIR="src"

# === Execução ===
echo "🔄 Clonando repositório do Azure DevOps..."
git clone $AZDO_REPO_URL $TARGET_DIR

echo "📦 Instalando dependências..."
cd $TARGET_DIR
npm install

echo "✅ Pronto! Repositório clonado e dependências instaladas."
