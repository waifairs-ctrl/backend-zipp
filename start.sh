#!/bin/sh
set -e

# Ensure storage directories exist and are writable
mkdir -p storage/framework/cache/data storage/framework/sessions storage/framework/views storage/logs bootstrap/cache
chmod -R 775 storage bootstrap/cache 2>/dev/null || true

# If SQLite is configured or default, ensure the database file exists
if [ "${DB_CONNECTION:-sqlite}" = "sqlite" ]; then
    DB_FILE="${DB_DATABASE:-database/database.sqlite}"
    mkdir -p "$(dirname "$DB_FILE")" 2>/dev/null || true
    touch "$DB_FILE" 2>/dev/null || true
fi

# Run migrations safely if RUN_MIGRATIONS=true (non-destructive)
if [ "${RUN_MIGRATIONS:-false}" = "true" ]; then
    echo "==> Running safe migrations..."
    php artisan migrate --force --no-interaction || true
fi

# Clear any cached configuration so runtime environment variables are respected
php artisan config:clear || true
php artisan route:clear || true

# Start Laravel using PORT provided by Railway (defaulting to 8000)
PORT="${PORT:-8000}"
echo "==> Starting Waifair Laravel backend on 0.0.0.0:$PORT"
exec php artisan serve --host=0.0.0.0 --port="$PORT"
