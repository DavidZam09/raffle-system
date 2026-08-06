CREATE TABLE payment_methods (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,

    name VARCHAR(100) NOT NULL,
    description TEXT,

    account_owner VARCHAR(150),
    account_number VARCHAR(100),

    requires_receipt BOOLEAN NOT NULL DEFAULT TRUE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_payment_method_per_user
        UNIQUE(user_id, name)
);

CREATE INDEX idx_payment_methods_user
ON payment_methods(user_id);

CREATE INDEX idx_payment_methods_active
ON payment_methods(is_active);