package database

import (
	"context"
	"log"

	"github.com/jackc/pgx/v5/pgxpool"
)

func NewDatabase(databaseURL string) *pgxpool.Pool {
	dbpool, err := pgxpool.New(context.Background(), databaseURL)
	if err != nil {
		log.Fatal("Unable to connect to database: ", err)
	}

	err = dbpool.Ping(context.Background())
	if err != nil {
		log.Fatal("Database ping failed: ", err)
	}

	log.Println("Database connected")

	return dbpool
}
