package dto

import "github.com/DavidZam09/raffle-system/backend/internal/models"

type LoginResponse struct {
	Token string `json:"token"`
	User models.User `json:"user"`
}
	