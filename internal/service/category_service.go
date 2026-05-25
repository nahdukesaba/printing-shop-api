package service

import (
	"context"

	"printing-shop/internal/dto"
	"printing-shop/internal/repository"
)

type CategoryService struct {
	Queries *repository.Queries
}

func NewCategoryService(q *repository.Queries) *CategoryService {
	return &CategoryService{
		Queries: q,
	}
}

func (s *CategoryService) CreateCategory(req dto.CreateCategoryRequest) (*repository.Category, error) {
	category, err := s.Queries.CreateCategory(context.Background(), repository.CreateCategoryParams{
		Name: req.Name,
		Slug: req.Slug,
	})

	if err != nil {
		return nil, err
	}

	return &category, nil
}

func (s *CategoryService) GetCategories() ([]repository.Category, error) {
	return s.Queries.GetCategories(context.Background())
}
