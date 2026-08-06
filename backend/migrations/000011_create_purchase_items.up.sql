CREATE TABLE purchase_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    purchase_id UUID NOT NULL,
    raffle_number_id UUID NOT NULL,

    price NUMERIC(12,2) NOT NULL,

    number INTEGER NOT NULL,
    number_label VARCHAR(10) NOT NULL,

    status purchase_item_status NOT NULL DEFAULT 'PENDING',

    approved_by UUID,
    approved_at TIMESTAMPTZ,

    rejection_reason TEXT,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_purchase_items_purchase
        FOREIGN KEY (purchase_id)
        REFERENCES purchases(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_purchase_items_raffle_number
        FOREIGN KEY (raffle_number_id)
        REFERENCES raffle_numbers(id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_purchase_items_approved_by
        FOREIGN KEY (approved_by)
        REFERENCES users(id)
        ON DELETE SET NULL,

    CONSTRAINT uq_purchase_items_raffle_number
        UNIQUE (raffle_number_id),

    CONSTRAINT chk_purchase_item_price
        CHECK (price >= 0)
);

CREATE INDEX idx_purchase_items_purchase
ON purchase_items(purchase_id);

CREATE INDEX idx_purchase_items_raffle_number
ON purchase_items(raffle_number_id);

CREATE INDEX idx_purchase_items_status
ON purchase_items(status);

CREATE INDEX idx_purchase_items_approved_by
ON purchase_items(approved_by);