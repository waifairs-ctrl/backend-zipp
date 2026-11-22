# Waifair Shopping Store - Laravel 11 Backend API

Production-ready Laravel 11 API backend for the Waifair e-commerce platform, pre-configured for direct deployment on Railway.

## Included Endpoints
- `GET /` & `GET /health` & `GET /up`: Health check routes for Railway zero-downtime deployments.
- `GET /api/health`: Health status endpoint.
- `GET /api/system/status`: Server diagnostic and platform status.
- `GET /api/orders` & `POST /api/orders`: Order creation and status inquiry.
- `GET /api/orders/{id}`: Single order lookup.
- `POST /api/orders/webhook`: Payment gateway and courier tracking webhooks.
- `GET /api/products` & `POST /api/products`: Catalog listing and product creation.
- `GET /api/products/{id}`: Single product lookup.
- `GET /api/sellers`: Seller listing.
- `POST /api/sellers/kyc-verify`: Compliance auditing for seller KYC.
- `POST /api/payouts/validate`: Withdrawal validation.
- `POST /api/auth/verify`: Bearer token authentication check.
- `POST /api/auth/login`: Authentication login endpoint.
- `POST /api/auth/set-custom-claims`: Firebase / Admin custom user claims assignment.

## Railway Deployment Settings

### Build Command:
```bash
composer install --no-dev --optimize-autoloader --no-interaction
```

### Start Command:
```bash
sh start.sh
```
*(Alternatively: `php artisan serve --host=0.0.0.0 --port=$PORT`)*

### Health Check Path:
```
/health
```

## Railway Environment Variables
Configure the following in the Railway project **Variables** tab:

| Variable | Value | Description |
|---|---|---|
| `APP_NAME` | `Waifair Shopping Store` | Application name |
| `APP_ENV` | `production` | Deployment environment |
| `APP_DEBUG` | `false` | Disable debug details in production |
| `APP_KEY` | `base64:...` | 32-byte AES key (generate with `php artisan key:generate --show`) |
| `APP_URL` | `https://${{RAILWAY_PUBLIC_DOMAIN}}` | Your Railway public URL |
| `DB_CONNECTION` | `sqlite` (or `mysql` / `pgsql`) | Database connection |
| `DB_DATABASE` | `database/database.sqlite` | Path for SQLite database |
| `CORS_ALLOWED_ORIGINS` | `*` | Allowed CORS origins (or frontend Vercel URL) |
| `RUN_MIGRATIONS` | `false` | Set to `true` to run safe migrations on startup |

> **Note on Railway Databases:**
> If you attach a Railway MySQL or PostgreSQL service, `config/database.php` will automatically detect `MYSQLHOST`/`MYSQL_URL` or `PGHOST`/`DATABASE_URL`.
