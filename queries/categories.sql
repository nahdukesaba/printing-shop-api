-- name: CreateCategory :one
INSERT INTO categories (
    name,
    slug
)
VALUES (
           $1,
           $2
       )
    RETURNING *;

-- name: GetCategories :many
SELECT * FROM categories
ORDER BY created_at DESC;

-- name: GetCategoryByID :one
SELECT * FROM categories
WHERE id = $1
    LIMIT 1;

-- name: DeleteCategory :exec
DELETE FROM categories
WHERE id = $1;