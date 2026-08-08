package models

import (
	"time"
	"github.com/google/uuid"
)

type Purchase struct {
	ID uuid.UUID
	CustomerID uuid.UUID
	RaffleID uuid.UUID
	TotalAmount float64
	Status string
	Origin string
	ExpiresAt time.Time
	PurchaseCode string
	ReservationExpiresAt time.Time
	ApprovedAt time.Time
	CreatedAt time.Time
	UpdatedAt time.Time
}