-- name: CreateServiceVariant :one
INSERT INTO service_variants (
    service_id,
    name,
    paper_size,
    color_mode,
    price,
    notes
)
VALUES (
           $1,
           $2,
           $3,
           $4,
           $5,
           $6
       )
    RETURNING *;

-- name: GetVariantsByService :many
SELECT * FROM service_variants
WHERE service_id = $1
ORDER BY created_at DESC;

-- name: DeleteVariantsById :exec
DELETE FROM service_variants
WHERE id = $1;

-- name: GetAllVariants :many
SELECT * FROM service_variants
ORDER BY created_at DESC;

-- name: UpdateVariantsById :one
UPDATE service_variants SET
name=$2, paper_size=$3, color_mode=$4,
price=$5, notes=$6, active=$7, service_id=$8
WHERE id=$1 RETURNING *;

-- name: Get