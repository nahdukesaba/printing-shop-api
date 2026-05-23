-- +goose Up
CREATE TABLE IF NOT EXISTS categories (
                                          id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    slug TEXT NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
    );

-- +goose Down
DROP TABLE categories;