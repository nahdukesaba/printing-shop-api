package handler

import (
	"printing-shop/internal/dto"
	"printing-shop/internal/service"
	"printing-shop/internal/utils"
	validatorPkg "printing-shop/internal/validator"

	"github.com/gofiber/fiber/v2"
)

type CategoryHandler struct {
	Service *service.CategoryService
}

func NewCategoryHandler(service *service.CategoryService) *CategoryHandler {
	return &CategoryHandler{
		Service: service,
	}
}

func (h *CategoryHandler) CreateCategory(c *fiber.Ctx) error {
	var req dto.CreateCategoryRequest

	if err := c.BodyParser(&req); err != nil {
		return utils.Error(c, fiber.StatusBadRequest, "Invalid request body", err.Error())
	}

	if err := validatorPkg.Validate.Struct(req); err != nil {
		return utils.Error(c, fiber.StatusBadRequest, "Validation failed", err.Error())
	}

	category, err := h.Service.CreateCategory(req)
	if err != nil {
		return utils.Error(c, fiber.StatusInternalServerError, "Failed to create category", err.Error())
	}

	return utils.Success(c, "Category created", category)
}

func (h *CategoryHandler) GetCategories(c *fiber.Ctx) error {
	categories, err := h.Service.GetCategories()

	if err != nil {
		return utils.Error(c, fiber.StatusInternalServerError, "Failed to fetch categories", err.Error())
	}

	return utils.Success(c, "Categories fetched", categories)
}
