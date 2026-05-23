package utils

import (
	"path/filepath"
	"strings"
)

var AllowedExtensions = map[string]bool{
	".pdf":  true,
	".png":  true,
	".jpg":  true,
	".jpeg": true,
	".docx": true,
	".doc":  true,
}

func IsAllowedFile(filename string) bool {
	ext := strings.ToLower(filepath.Ext(filename))

	return AllowedExtensions[ext]
}
