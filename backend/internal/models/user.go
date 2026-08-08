package models

import (
	"time"

	"github.com/google/uuid"
)

type User struct {
	ID             uuid.UUID
	Username       string
	DisplayName    string
	FirstName      string
	LastName       string
	Email          string
	PasswordHash   string
	Phone          *string
	ProfileImageID *uuid.UUID
	Role           string
	Active         bool
	LastLoginAt    *time.Time
	CreatedAt      time.Time
	UpdatedAt      time.Time
}