package main

import (
	"log"
	"printing-shop/internal/config"
	"printing-shop/internal/database"
	"printing-shop/internal/handler"
	"printing-shop/internal/middleware"
	"printing-shop/internal/repository"
	"printing-shop/internal/service"
	"printing-shop/internal/utils"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
	fiberLogger "github.com/gofiber/fiber/v2/middleware/logger"
	"github.com/gofiber/fiber/v2/middleware/recover"
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

	protected := api.Group("/protected", middleware.Protected(cfg.SupabaseJWTSecret))

	protected.Get("/", func(c *fiber.Ctx) error {
		user := c.Locals("user")

		return utils.Success(c, "Protected route", user)
	})

	queries := repository.New(db)

	categoryService := service.NewCategoryService(queries)

	categoryHandler := handler.NewCategoryHandler(categoryService)
	categories := api.Group("/categories")

	categories.Get("/", categoryHandler.GetCategories)
	categories.Post("/", categoryHandler.CreateCategory)

	app.Use(cors.New(cors.Config{
		AllowOrigins: "https://yourfrontend.com",
		AllowHeaders: "Origin, Content-Type, Accept, Authorization",
	}))

	log.Fatal(app.Listen(":" + cfg.AppPort))
}
