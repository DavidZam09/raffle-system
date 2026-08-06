package main

import (
	"github.com/DavidZam09/raffle-system/backend/internal/config"
	"github.com/DavidZam09/raffle-system/backend/internal/database"

	"github.com/gin-gonic/gin"
)

func main() {

	cfg := config.Load()

	db := database.New(cfg)

	defer db.Close()

	router := gin.Default()

	router.GET("/health", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"status": "ok",
		})
	})

	router.Run(":" + cfg.AppPort)
}
