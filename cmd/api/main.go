package main

import (
	"log"

	"github.com/gofiber/fiber/v2"
	fiberLogger "github.com/gofiber/fiber/v2/middleware/logger"
	"github.com/gofiber/fiber/v2/middleware/recover"

	"github.com/nahdukesaba/printing-shop-backend/internal/config"
	"github.com/nahdukesaba/printing-shop-backend/internal/database"
	"github.com/nahdukesaba/printing-shop-backend/internal/middleware"
	"github.com/nahdukesaba/printing-shop-backend/internal/utils"
)

func main() {
	cfg := config.LoadConfig()

	utils.InitLogger()

	db := database.NewDatabase(cfg.DatabaseURL)
	defer db.Close()

	app := fiber.New(fiber.Config{
		ErrorHandler: middleware.ErrorHandler,
	})

	app.Use(recover.New())

	app.Use(fiberLogger.New())

	api := app.Group("/api")

	api.Get("/health", func(c *fiber.Ctx) error {
		return utils.Success(c, "API is running", nil)
	})

	log.Fatal(app.Listen(":" + cfg.AppPort))
}
