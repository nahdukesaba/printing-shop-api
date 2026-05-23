package utils

import (
	"bytes"
	"fmt"
	"io"
	"mime/multipart"
	"net/http"
)

func UploadFileToSupabase(
	supabaseURL string,
	serviceRoleKey string,
	bucket string,
	fileName string,
	file multipart.File,
) (string, error) {

	uploadURL := fmt.Sprintf(
		"%s/storage/v1/object/%s/%s",
		supabaseURL,
		bucket,
		fileName,
	)

	fileBytes, err := io.ReadAll(file)
	if err != nil {
		return "", err
	}

	req, err := http.NewRequest(
		http.MethodPost,
		uploadURL,
		bytes.NewReader(fileBytes),
	)

	if err != nil {
		return "", err
	}

	req.Header.Set("Authorization", "Bearer "+serviceRoleKey)
	req.Header.Set("apikey", serviceRoleKey)
	req.Header.Set("Content-Type", "application/octet-stream")

	client := &http.Client{}

	resp, err := client.Do(req)
	if err != nil {
		return "", err
	}

	defer resp.Body.Close()

	if resp.StatusCode >= 300 {
		body, _ := io.ReadAll(resp.Body)
		return "", fmt.Errorf("upload failed: %s", string(body))
	}

	return fmt.Sprintf(
		"%s/storage/v1/object/public/%s/%s",
		supabaseURL,
		bucket,
		fileName,
	), nil
}
