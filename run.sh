#!/bin/bash
set -e

echo "== Odoo Development Stack =="

# Load env
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
else
  echo "⚠️  .env not found, using defaults"
fi

# Stop current stack
echo "Stopping existing containers..."
sudo docker compose down

# Start stack
echo "Starting Odoo stack..."
sudo docker compose up -d

# Wait for healthy status
echo "Waiting for services to be ready..."
sleep 8

# Show status
echo ""
echo "=== Container Status ==="
sudo docker compose ps

echo ""
echo "✅ Stack started successfully!"
echo ""