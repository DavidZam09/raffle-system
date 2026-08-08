package models

import (
	"time"

	"github.com/google/uuid"
)

type Raffle struct {
	ID          uuid.UUID
	OwnerID     uuid.UUID
	Title       string
	Description string
	TicketPrice float64
	TotalNumbers int
	Status string
	SalesStartAt time.Time
	SalesEndAt   time.Time
	PublishedAt  time.Time
	CreatedAt    time.Time
	UpdatedAt    time.Time
}
