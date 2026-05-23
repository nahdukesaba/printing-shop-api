-- name: CreateService :one
INSERT INTO services (
    category_id,
    name,
    slug,
    description,
    thumbnail_url
)
VALUES (
           $1,
           $2,
           $3,
           $4,
           $5
       )
    RETURNING *;

-- name: GetServices :many
SELECT * FROM services
ORDER BY created_at DESC;

-- name: GetServiceBySlug :one
SELECT * FROM services
WHERE slug = $1
    LIMIT 1;