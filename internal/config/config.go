package config

import (
	"log"
	"os"

	"github.com/joho/godotenv"
)

type Config struct {
	AppEnv                 string
	AppPort                string
	DatabaseURL            string
	SupabaseURL            string
	SupabaseAnonKey        string
	SupabaseJWTSecret      string
	MaxUploadSize          string
	SupabaseServiceRoleKey string
}

func LoadConfig() *Config {
	err := godotenv.Load()
	if err != nil {
		log.Println(".env file not found")
	}

	return &Config{
		AppEnv:                 os.Getenv("APP_ENV"),
		AppPort:                os.Getenv("APP_PORT"),
		DatabaseURL:            os.Getenv("DATABASE_URL"),
		SupabaseURL:            os.Getenv("SUPABASE_URL"),
		SupabaseAnonKey:        os.Getenv("SUPABASE_ANON_KEY"),
		SupabaseJWTSecret:      os.Getenv("SUPABASE_JWT_SECRET"),
		MaxUploadSize:          os.Getenv("MAX_UPLOAD_SIZE"),
		SupabaseServiceRoleKey: os.Getenv("SUPABASE_SERVICE_ROLE_KEY"),
	}
}
