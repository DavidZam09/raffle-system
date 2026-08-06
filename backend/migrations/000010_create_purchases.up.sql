CREATE TABLE purchases (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    raffle_id UUID NOT NULL,
    customer_id UUID NOT NULL,

    status purchase_status NOT NULL DEFAULT 'PENDING_PAYMENT',

    origin purchase_origin NOT NULL DEFAULT 'WEB',

    total_amount NUMERIC(12,2) NOT NULL DEFAULT 0,

    expires_at TIMESTAMPTZ,

    purchase_code VARCHAR(20) NOT NULL UNIQUE,

    reservation_expires_at TIMESTAMPTZ,

    approved_at TIMESTAMPTZ,


    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_purchases_raffle
        FOREIGN KEY (raffle_id)
        REFERENCES raffles(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_purchases_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(id)
        ON DELETE RESTRICT,

    CONSTRAINT chk_total_amount
        CHECK (total_amount >= 0)
);

CREATE INDEX idx_purchases_raffle
ON purchases(raffle_id);

CREATE INDEX idx_purchases_customer
ON purchases(customer_id);

CREATE INDEX idx_purchases_status
ON purchases(status);

CREATE INDEX idx_purchases_origin
ON purchases(origin);

CREATE INDEX idx_purchases_created_at
ON purchases(created_at);