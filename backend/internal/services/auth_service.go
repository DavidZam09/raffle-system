package services

import (
	"context"
	"errors"

	"github.com/DavidZam09/raffle-system/backend/internal/models"
	"github.com/DavidZam09/raffle-system/backend/internal/repositories"

	"golang.org/x/crypto/bcrypt"
)

var (
	ErrInvalidCredentials = errors.New("credenciales inválidas")
	ErrInactiveUser       = errors.New("usuario inactivo")
)

type AuthService struct {
	userRepository repositories.UserRepository
}

func NewAuthService(
	userRepository repositories.UserRepository,
) *AuthService {
	return &AuthService{
		userRepository: userRepository,
	}
}

func (s *AuthService) Login(
	ctx context.Context,
	username string,
	password string,
) (*models.User, error) {

	user, err := s.userRepository.FindByUsername(ctx, username)

	if err != nil {
		return nil, err
	}

	if user == nil {
		return nil, ErrInvalidCredentials
	}

	if !user.Active {
		return nil, ErrInactiveUser
	}

	err = bcrypt.CompareHashAndPassword(
		[]byte(user.PasswordHash),
		[]byte(password),
	)

	if err != nil {
		return nil, ErrInvalidCredentials
	}

	return user, nil
}