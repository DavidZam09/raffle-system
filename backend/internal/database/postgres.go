package database

import (
	"context"
	"fmt"
	"log"

	"github.com/DavidZam09/raffle-system/backend/internal/config"

	"github.com/jackc/pgx/v5/pgxpool"
)

func New(cfg *config.Config) *pgxpool.Pool {

	connString := fmt.Sprintf(
		"host=%s port=%s user=%s password=%s dbname=%s sslmode=%s",
		cfg.DBHost,
		cfg.DBPort,
		cfg.DBUser,
		cfg.DBPassword,
		cfg.DBName,
		cfg.DBSSLMode,
	)

	db, err := pgxpool.New(context.Background(), connString)

	if err != nil {
		log.Fatal(err)
	}

	err = db.Ping(context.Background())

	if err != nil {
		log.Fatal(err)
	}

	log.Println("✅ PostgreSQL conectado")

	return db
}