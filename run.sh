#!/bin/bash
set -e

echo "== Odoo stack start =="

# Load env
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
else
  echo ".env not found"
  exit 1
fi

# Stop only this stack
sudo docker compose down

# Start stack
sudo docker compose up -d

# Show status
sudo docker compose ps

echo "Done. Logs: sudo docker compose logs -f odoo"
