package main

import (
	"log"

	"github.com/pocketbase/pocketbase"
)

func main() {
	app := pocketbase.New()

	// ❗ Correct way: RootCmd is a variable, not a function
	app.RootCmd.SetArgs([]string{"serve", "--http=0.0.0.0:8090"})

	if err := app.Start(); err != nil {
		log.Fatal(err)
	}
}
