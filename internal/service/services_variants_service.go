package service

import (
	"context"
	"printing-shop/internal/dto"
	"printing-shop/internal/repository"

	"github.com/google/uuid"
	"github.com/jackc/pgx/v5/pgtype"
)

type ServicesVariantsService struct {
	Queries *repository.Queries
}

func NewServicesVariantsService(q *repository.Queries) *ServicesVariantsService {
	return &ServicesVariantsService{
		Queries: q,
	}
}

func (s *ServicesVariantsService) CreateServicesVariants(req dto.CreateServiceVariantsRequest) (*repository.ServiceVariant, error) {
	serviceID, err := uuid.Parse(req.ServiceID)
	if err != nil {
		return nil, err
	}

	sVariants, err := s.Queries.CreateServiceVariant(context.Background(), repository.CreateServiceVariantParams{
		ServiceID: pgtype.UUID{
			Bytes: serviceID,
			Valid: true,
		},
		Name:      req.Name,
		PaperSize: req.PaperSize,
		ColorMode: req.ColorMode,
		Price:     req.Price,
		Notes:     req.Notes,
	})

	if err != nil {
		return nil, err
	}

	return &sVariants, nil
}

func (s *ServicesVariantsService) GetServicesVariants() ([]repository.ServiceVariant, error) {
	return s.Queries.GetAllVariants(context.Background())
}

func (s *ServicesVariantsService) UpdateServicesVariants(req dto.EditServiceVariantsRequest) (*repository.ServiceVariant, error) {
	serviceID, err := uuid.Parse(req.ServiceID)
	if err != nil {
		return nil, err
	}
	id, err := uuid.Parse(req.ID)
	if err != nil {
		return nil, err
	}

	sVariants, err := s.Queries.UpdateVariantsById(context.Background(), repository.UpdateVariantsByIdParams{
		ID: pgtype.UUID{
			Bytes: id,
			Valid: true,
		},
		ServiceID: pgtype.UUID{
			Bytes: serviceID,
			Valid: true,
		},
		Name:      req.Name,
		PaperSize: req.PaperSize,
		ColorMode: req.ColorMode,
		Price:     req.Price,
		Notes:     req.Notes,
		Active: pgtype.Bool{
			Bool:  req.Active,
			Valid: true,
		},
	})

	if err != nil {
		return nil, err
	}

	return &sVariants, nil
}

func (s *ServicesVariantsService) DeleteServicesVariants(id uuid.UUID) error {
	return s.DeleteServicesVariants(id)
}
