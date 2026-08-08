package models

import (
	"time"
	"github.com/google/uuid"
)

type Customer struct {
	ID uuid.UUID
	UserID uuid.UUID
	FirstName string
	LastName string
	DocumentNumber string
	Notes string
	CreatedAt time.Time
	UpdatedAt time.Time
}
