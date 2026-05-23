-- +goose Up
CREATE TABLE IF NOT EXISTS print_requests (
                                              id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    user_id UUID NULL REFERENCES users(id) ON DELETE SET NULL,

    service_variant_id UUID NOT NULL REFERENCES service_variants(id),

    customer_name TEXT NOT NULL,
    phone TEXT NOT NULL,
    notes TEXT,

    copies INTEGER NOT NULL,

    paper_size TEXT NOT NULL,
    color_mode TEXT NOT NULL,
    delivery_type TEXT NOT NULL,

    due_date TIMESTAMP NULL,

    status TEXT NOT NULL DEFAULT 'pending',

    file_path TEXT NOT NULL,
    payment_proof_path TEXT NOT NULL,

    invoice_number TEXT NOT NULL UNIQUE,

    total_price BIGINT NOT NULL,

    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
    );

-- +goose Down
DROP TABLE print_requests;