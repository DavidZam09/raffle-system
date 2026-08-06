CREATE TABLE raffle_settings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    raffle_id UUID NOT NULL,

    reservation_minutes INTEGER NOT NULL DEFAULT 20,

    allow_manual_sales BOOLEAN NOT NULL DEFAULT TRUE,

    allow_multiple_payments BOOLEAN NOT NULL DEFAULT TRUE,

    show_remaining_numbers BOOLEAN NOT NULL DEFAULT TRUE,

    show_sold_numbers BOOLEAN NOT NULL DEFAULT TRUE,

    is_public BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_raffle_settings_raffle
        FOREIGN KEY (raffle_id)
        REFERENCES raffles(id)
        ON DELETE CASCADE,

    CONSTRAINT uq_raffle_settings_raffle
        UNIQUE (raffle_id),

    CONSTRAINT chk_reservation_minutes
        CHECK (reservation_minutes > 0)
);

CREATE INDEX idx_raffle_settings_raffle
ON raffle_settings(raffle_id);