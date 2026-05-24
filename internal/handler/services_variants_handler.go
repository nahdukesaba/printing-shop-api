package handler

import (
	"printing-shop/internal/service"
)

type ServiceVariantsHandler struct {
	Service *service.ServicesVariantsService
}

func NewServiceVariantsHandler(service *service.ServicesVariantsService) *ServiceVariantsHandler {
	return &ServiceVariantsHandler{
		Service: service,
	}
}

//func (h *ServiceVariantsHandler) CreateServiceVariants(c *fiber.Ctx) error {
//	var req dto.CreateServiceVariantsRequest
//
//	if err := c.BodyParser(&req); err != nil {
//		return utils.Error(c, fiber.StatusBadRequest, "Invalid request body", err.Error())
//	}
//
//	if err := validatorPkg.Validate.Struct(req); err != nil {
//		return utils.Error(c, fiber.StatusBadRequest, "Validation failed", err.Error())
//	}
//
//	sVariants, err := h.Service.CreateServiceVariants(req)
//	if err != nil {
//		return utils.Error(c, fiber.StatusInternalServerError, "Failed to create category", err.Error())
//	}
//
//	return utils.Success(c, "Category created", sVariants)
//}
