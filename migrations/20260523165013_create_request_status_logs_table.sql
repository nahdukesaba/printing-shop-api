-- +goose Up
CREATE TABLE IF NOT EXISTS request_status_logs (
                                                   id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    print_request_id UUID NOT NULL REFERENCES print_requests(id) ON DELETE CASCADE,

    old_status TEXT,
    new_status TEXT NOT NULL,

    changed_by UUID NULL REFERENCES users(id),

    created_at TIMESTAMP DEFAULT NOW()
    );

-- +goose Down
DROP TABLE request_status_logs;