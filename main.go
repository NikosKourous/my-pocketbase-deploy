package main

import (
	"log"

	"github.com/pocketbase/pocketbase"
)

func main() {
	app := pocketbase.New()

	// Tell PocketBase to listen on 0.0.0.0:8090 (required for Railway)
	app.RootCmd().SetArgs([]string{"serve", "--http=0.0.0.0:8090"})

	if err := app.Start(); err != nil {
		log.Fatal(err)
	}
}
