CREATE TABLE payment_confirmations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    purchase_id UUID NOT NULL,
    payment_method_id UUID NOT NULL,

    amount NUMERIC(12,2) NOT NULL,

    reference VARCHAR(100),

    receipt_file_id UUID,

    status payment_status NOT NULL DEFAULT 'UNDER_REVIEW',

    notes TEXT,

    reviewed_by UUID,
    reviewed_at TIMESTAMPTZ,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_payment_confirmations_purchase
        FOREIGN KEY (purchase_id)
        REFERENCES purchases(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_payment_confirmations_payment_method
        FOREIGN KEY (payment_method_id)
        REFERENCES payment_methods(id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_payment_confirmations_receipt
        FOREIGN KEY (receipt_file_id)
        REFERENCES files(id)
        ON DELETE SET NULL,

    CONSTRAINT fk_payment_confirmations_reviewed_by
        FOREIGN KEY (reviewed_by)
        REFERENCES users(id)
        ON DELETE SET NULL,

    CONSTRAINT chk_payment_amount
        CHECK (amount >= 0)
);

CREATE INDEX idx_payment_confirmations_purchase
ON payment_confirmations(purchase_id);

CREATE INDEX idx_payment_confirmations_status
ON payment_confirmations(status);

CREATE INDEX idx_payment_confirmations_reviewed_by
ON payment_confirmations(reviewed_by);

CREATE INDEX idx_payment_confirmations_payment_method
ON payment_confirmations(payment_method_id);