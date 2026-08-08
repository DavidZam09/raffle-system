package main

import (
	"log"
	"net/http"

	"github.com/DavidZam09/raffle-system/backend/internal/config"
	"github.com/DavidZam09/raffle-system/backend/internal/database"

	"github.com/gin-gonic/gin"
)

func main() {

	cfg := config.Load()

	db, err := database.New(cfg)
	if err != nil {
		log.Fatalf("Error al conectar a la base de datos: %v", err)
	}

	defer db.Close()

	router := gin.Default()

	router.GET("/health", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"status": "ok",
		})
	})

	server := &http.Server{
		Addr:    ":" + cfg.AppPort,
		Handler: router,
	}

	log.Fatal(server.ListenAndServe())
}
