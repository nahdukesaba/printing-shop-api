package handler

import (
	"printing-shop/internal/service"
	"printing-shop/internal/utils"

	"github.com/gofiber/fiber/v2"
)

type ServiceHandler struct {
	Service *service.ServiceService
}

func NewServiceHandler(service *service.ServiceService) *ServiceHandler {
	return &ServiceHandler{
		Service: service,
	}
}

func (h *ServiceHandler) GetServices(c *fiber.Ctx) error {
	services, err := h.Service.GetServices()

	if err != nil {
		return utils.Error(c, fiber.StatusInternalServerError, "Failed to fetch categories", err.Error())
	}

	return utils.Success(c, "Services fetched", services)
}
