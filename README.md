# raffle-system

Sistema de rifas con backend en Go y base de datos PostgreSQL.

## Requisitos

- Go 1.25+
- Docker y Docker Compose

## Inicio rápido

1. Copia `.env.example` a `.env` y configura las variables.
2. Levanta PostgreSQL: `docker compose up -d`
3. Ejecuta las migraciones y el API desde `backend/`.
