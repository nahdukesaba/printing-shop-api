-- name: CreatePrintRequest :one
INSERT INTO print_requests (
    user_id,
    service_variant_id,
    customer_name,
    phone,
    notes,
    copies,
    paper_size,
    color_mode,
    delivery_type,
    due_date,
    status,
    file_path,
    payment_proof_path,
    invoice_number,
    total_price
)
VALUES (
           $1,
           $2,
           $3,
           $4,
           $5,
           $6,
           $7,
           $8,
           $9,
           $10,
           $11,
           $12,
           $13,
           $14,
           $15
       )
    RETURNING *;

-- name: GetPrintRequests :many
SELECT * FROM print_requests
ORDER BY created_at DESC;

-- name: GetPrintRequestsByUser :many
SELECT * FROM print_requests
WHERE user_id = $1
ORDER BY created_at DESC;

-- name: UpdatePrintRequestStatus :one
UPDATE print_requests
SET status = $2,
    updated_at = NOW()
WHERE id = $1
    RETURNING *;