-- +goose Up
CREATE TABLE IF NOT EXISTS service_variants (
                                                id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    service_id UUID NOT NULL REFERENCES services(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    price TEXT ,
    unit TEXT,
    icon TEXT,
    active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW()
    );

-- +goose Down
DROP TABLE service_variants;