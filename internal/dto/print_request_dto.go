package dto

type CreatePrintRequestRequest struct {
	ServiceVariantID string `form:"service_variant_id"`
	CustomerName     string `form:"customer_name"`
	Phone            string `form:"phone"`
	Notes            string `form:"notes"`
	Copies           int32  `form:"copies"`
	PaperSize        string `form:"paper_size"`
	ColorMode        string `form:"color_mode"`
	DeliveryType     string `form:"delivery_type"`
	DueDate          string `form:"due_date"`
}
