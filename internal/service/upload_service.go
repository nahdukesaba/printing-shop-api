package service

import (
	"fmt"
	"mime/multipart"
	"path/filepath"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/google/uuid"
)

type UploadService struct{}

func NewUploadService() *UploadService {
	return &UploadService{}
}

func (s *UploadService) GenerateFileName(file *multipart.FileHeader) string {
	ext := filepath.Ext(file.Filename)

	return fmt.Sprintf(
		"%d-%s-%s",
		time.Now().Unix(),
		uuid.New().String(),
		ext,
	)
}

func (s *UploadService) ValidateFile(c *fiber.Ctx, file *multipart.FileHeader) error {
	if file.Size > 50*1024*1024 {
		return fiber.NewError(fiber.StatusBadRequest, "File too large")
	}

	return nil
}
