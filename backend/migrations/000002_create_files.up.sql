CREATE TABLE files (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    original_name VARCHAR(255) NOT NULL,
    
    storage_name VARCHAR(255) NOT NULL,
    path TEXT NOT NULL,

    mime_type VARCHAR(100) NOT NULL,
    size BIGINT NOT NULL,

    file_type file_type NOT NULL DEFAULT 'OTHER',

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE UNIQUE INDEX idx_files_storage_name
ON files(storage_name);

CREATE INDEX idx_files_type
ON files(file_type);