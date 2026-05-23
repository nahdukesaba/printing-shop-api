-- +goose Up
CREATE TABLE IF NOT EXISTS users (
                                     id UUID PRIMARY KEY,
                                     full_name TEXT NOT NULL,
                                     phone TEXT,
                                     role TEXT NOT NULL DEFAULT 'customer',
                                     created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
    );

-- +goose Down
DROP TABLE users;