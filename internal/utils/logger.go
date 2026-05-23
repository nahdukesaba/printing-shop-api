package utils

import (
	"os"

	"github.com/rs/zerolog"
)

var Log zerolog.Logger

func InitLogger() {
	logFile, _ := os.OpenFile(
		"logs/app.log",
		os.O_APPEND|os.O_CREATE|os.O_WRONLY,
		0666,
	)

	Log = zerolog.New(logFile).
		With().
		Timestamp().
		Logger()
}
