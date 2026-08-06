CREATE TABLE payment_confirmation_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    payment_confirmation_id UUID NOT NULL,
    purchase_item_id UUID NOT NULL,

    amount NUMERIC(12,2) NOT NULL,

    applied_by UUID REFERENCES users(id) ON DELETE SET NULL,
    applied_at TIMESTAMPTZ,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_payment_confirmation_items_confirmation
        FOREIGN KEY (payment_confirmation_id)
        REFERENCES payment_confirmations(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_payment_confirmation_items_purchase_item
        FOREIGN KEY (purchase_item_id)
        REFERENCES purchase_items(id)
        ON DELETE CASCADE,

    CONSTRAINT uq_payment_confirmation_purchase_item
        UNIQUE (payment_confirmation_id, purchase_item_id),

    CONSTRAINT chk_payment_confirmation_item_amount
        CHECK (amount >= 0)
);

CREATE INDEX idx_payment_confirmation_items_confirmation
ON payment_confirmation_items(payment_confirmation_id);

CREATE INDEX idx_payment_confirmation_items_purchase_item
ON payment_confirmation_items(purchase_item_id);