CREATE TABLE raffle_numbers (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    raffle_id UUID NOT NULL,

    number INTEGER NOT NULL,

    status VARCHAR(20) NOT NULL DEFAULT 'AVAILABLE',

    reserved_until TIMESTAMPTZ,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_raffle_numbers_raffle
        FOREIGN KEY (raffle_id)
        REFERENCES raffles(id)
        ON DELETE CASCADE,

    CONSTRAINT uq_raffle_number
        UNIQUE (raffle_id, number),

    CONSTRAINT chk_number
        CHECK (number > 0),

    CONSTRAINT chk_number_status
        CHECK (
            status IN (
                'AVAILABLE',
                'RESERVED',
                'SOLD',
                'WINNER'
            )
        )
);