-- name: CreateServiceVariant :one
INSERT INTO service_variants (
    service_id,
    name,
    paper_size,
    color_mode,
    price
)
VALUES (
           $1,
           $2,
           $3,
           $4,
           $5
       )
    RETURNING *;

-- name: GetVariantsByService :many
SELECT * FROM service_variants
WHERE service_id = $1
ORDER BY created_at DESC;