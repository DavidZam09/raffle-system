CREATE TABLE customers (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,

    phone VARCHAR(20) NOT NULL,
    email VARCHAR(255),
    
    document_number VARCHAR(20) NULL,

    notes TEXT,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_customers_phone
ON customers(phone);

CREATE INDEX idx_customers_email
ON customers(email);

CREATE INDEX idx_customers_full_name
ON customers(last_name, first_name);