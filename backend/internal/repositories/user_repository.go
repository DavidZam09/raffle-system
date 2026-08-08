package repositories

import (
	"context"
	"errors"

	"github.com/DavidZam09/raffle-system/backend/internal/models"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgxpool"
)
const findByUsernameQuery = `
SELECT
			id,
			username,
			display_name,
			first_name,
			last_name,
			email,
			password_hash,
			phone,
			profile_image_id,
			role,
			active,
			last_login_at,
			created_at,
			updated_at
		FROM users
		WHERE username = $1
		LIMIT 1;
`
type UserRepository interface {
	FindByUsername(ctx context.Context, username string) (*models.User, error)
}

type userRepository struct {
	db *pgxpool.Pool
}

func NewUserRepository(db *pgxpool.Pool) UserRepository {
	return &userRepository{
		db: db,
	}
}

func (r *userRepository) FindByUsername(
	ctx context.Context,
	username string,
) (*models.User, error) {


	user := &models.User{}

	err := r.db.QueryRow(ctx, findByUsernameQuery, username).Scan(
		&user.ID,
		&user.Username,
		&user.DisplayName,
		&user.FirstName,
		&user.LastName,
		&user.Email,
		&user.PasswordHash,
		&user.Phone,
		&user.ProfileImageID,
		&user.Role,
		&user.Active,
		&user.LastLoginAt,
		&user.CreatedAt,
		&user.UpdatedAt,
	)

	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, nil
		}

		return nil, err
	}

	return user, nil
}