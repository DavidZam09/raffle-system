CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    username VARCHAR(100) NOT NULL,

    display_name VARCHAR(100) NOT NULL,

    first_name VARCHAR(255) NOT NULL,

    last_name VARCHAR(255) NOT NULL,

    email VARCHAR(255) NOT NULL UNIQUE,

    password_hash TEXT NOT NULL,

    phone VARCHAR(20),

    profile_image_id UUID REFERENCES files(id),

    role VARCHAR(20) NOT NULL DEFAULT 'customer',

    active BOOLEAN NOT NULL DEFAULT TRUE,
    
    last_login_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);