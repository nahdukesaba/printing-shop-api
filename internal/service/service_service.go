package service

import (
	"context"
	"printing-shop/internal/repository"
)

type ServiceService struct {
	Queries *repository.Queries
}

func NewServiceService(q *repository.Queries) *ServiceService {
	return &ServiceService{
		Queries: q,
	}
}

func (s *ServiceService) GetServices() ([]repository.Service, error) {
	return s.Queries.GetServices(context.Background())
}
