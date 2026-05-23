#!/bin/bash
# ai-setup.sh: Automated setup for a free local chatbot using Open WebUI and Ollama
# Usage: Run this script on your Raspberry Pi (me@p48)

set -e

# 1. Install Docker (if not already installed)
if ! command -v docker &> /dev/null; then
  echo "Installing Docker..."
  curl -sSL https://get.docker.com | sh
  sudo usermod -aG docker $USER
  echo "Docker installed. Please log out and log back in, then re-run this script."
  exit 0
fi

groups | grep -q docker || { echo "You must log out and log back in for Docker group permissions to take effect."; exit 1; }

# 2. Install Ollama (if not already installed)
if ! command -v ollama &> /dev/null; then
  echo "Installing Ollama..."
  curl -fsSL https://ollama.com/install.sh | sh
fi

# 3. Configure Ollama to listen on all interfaces
if ! grep -q 'OLLAMA_HOST=0.0.0.0' /etc/systemd/system/ollama.service.d/override.conf 2>/dev/null; then
  echo "Configuring Ollama to listen on all interfaces..."
  sudo mkdir -p /etc/systemd/system/ollama.service.d
  echo -e "[Service]\nEnvironment=\"OLLAMA_HOST=0.0.0.0\"" | sudo tee /etc/systemd/system/ollama.service.d/override.conf
  sudo systemctl daemon-reload
  sudo systemctl restart ollama
fi

# 4. Pull and run a lightweight model (DeepSeek 1.5B)
echo "Pulling DeepSeek 1.5B model..."
ollama run deepseek-r1:1.5b || true

# 5. Install Open WebUI via Docker
if ! docker ps -a --format '{{.Names}}' | grep -q '^open-webui$'; then
  echo "Starting Open WebUI Docker container..."
  docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui ghcr.io/open-webui/open-webui:main
else
  echo "Open WebUI container already exists. Restarting..."
  docker restart open-webui
fi

echo "\nSetup complete!"
echo "On your home computer, open a browser and go to: http://p48:3000 (or use your Pi's IP address)"
echo "Create an admin account if prompted, then select the 'deepseek-r1:1.5b' model in chat settings."
echo "You can also try other models, e.g. 'ollama run mistral', 'ollama run phi', etc."
