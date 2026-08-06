CREATE TABLE prizes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    raffle_id UUID NOT NULL,

    position SMALLINT NOT NULL,

    name VARCHAR(150) NOT NULL,

    description TEXT,

    image_url TEXT,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_prizes_raffle
        FOREIGN KEY (raffle_id)
        REFERENCES raffles(id)
        ON DELETE CASCADE,

    CONSTRAINT uq_prize_position
        UNIQUE (raffle_id, position),

    CONSTRAINT chk_prize_position
        CHECK (position > 0)
);