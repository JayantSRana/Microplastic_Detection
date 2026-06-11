#!/bin/bash
set -e

DOMAIN="your-domain.com"
EMAIL="your-email@example.com"

echo "=== Microplastic System Production Deployment ==="
echo "Domain: $DOMAIN"
echo ""

if [ "$DOMAIN" = "your-domain.com" ]; then
    echo "ERROR: Edit this script and set DOMAIN and EMAIL variables"
    exit 1
fi

echo "[1/5] Creating certbot directories..."
mkdir -p certbot/conf certbot/www

echo "[2/5] Starting services (HTTP only for certbot challenge)..."
docker compose -f docker-compose.prod.yml up -d nginx

echo "[3/5] Obtaining SSL certificate from Let's Encrypt..."
docker run --rm \
    -v "$(pwd)/certbot/conf:/etc/letsencrypt" \
    -v "$(pwd)/certbot/www:/var/www/certbot" \
    certbot/certbot certonly --webroot \
    --webroot-path=/var/www/certbot \
    --email "$EMAIL" \
    --agree-tos --no-eff-email \
    -d "$DOMAIN" -d "www.$DOMAIN"

echo "[4/5] Restarting nginx with SSL config..."
docker compose -f docker-compose.prod.yml restart nginx

echo "[5/5] Starting all services..."
docker compose -f docker-compose.prod.yml up -d

echo ""
echo "=== Deployment Complete ==="
echo "Frontend: https://$DOMAIN"
echo "Backend API: https://$DOMAIN/api/v1"
echo "API Docs: https://$DOMAIN/api/v1/docs"
echo ""
echo "To view logs: docker compose -f docker-compose.prod.yml logs -f"
echo "To stop: docker compose -f docker-compose.prod.yml down"