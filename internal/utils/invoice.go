package utils

import (
	"fmt"
	"time"
)

func GenerateInvoiceNumber() string {
	return fmt.Sprintf(
		"INV-%d",
		time.Now().Unix(),
	)
}
