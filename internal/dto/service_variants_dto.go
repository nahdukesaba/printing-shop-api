package dto

type CreateServiceVariantsRequest struct {
	ServiceID string `json:"service_id" validate:"required"`
	Name      string `json:"name" validate:"required"`
	PaperSize string `json:"paper_size" validate:"required"`
	ColorMode string `json:"color_mode" validate:"required"`
	Price     int64  `json:"price" validate:"required"`
	Notes     string `json:"notes" validate:"required"`
}

type EditServiceVariantsRequest struct {
	ID     string `json:"id" validate:"required"`
	Active bool   `json:"active"`
	CreateServiceVariantsRequest
}
