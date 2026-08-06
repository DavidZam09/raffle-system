CREATE TABLE raffles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    owner_id UUID NOT NULL,

    title VARCHAR(150) NOT NULL,

    description TEXT,

    ticket_price NUMERIC(12,2) NOT NULL,

    total_numbers INTEGER NOT NULL,

    status VARCHAR(20) NOT NULL DEFAULT 'draft',

    sales_start_at TIMESTAMPTZ NOT NULL,
    
    sales_end_at TIMESTAMPTZ NOT NULL,

    published_at TIMESTAMPTZ,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_raffles_owner
        FOREIGN KEY (owner_id)
        REFERENCES users(id)
        ON DELETE RESTRICT,

    CONSTRAINT chk_total_numbers
        CHECK (total_numbers > 0),

    CONSTRAINT chk_ticket_price
        CHECK (ticket_price > 0),

    CONSTRAINT chk_status
        CHECK (
            status IN (
                'draft',
                'published',
                'closed',
                'drawn',
                'cancelled'
            )
        )
);