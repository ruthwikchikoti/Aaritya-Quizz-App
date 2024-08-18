package main

import (
    "log"
    "net/http"
    "golang_backend/routes"
    "github.com/rs/cors"
)

func main() {
    router := routes.SetupRouter()
    handler := cors.Default().Handler(router)
    log.Println("Server is running on port 8000")
    log.Fatal(http.ListenAndServe(":8000", handler))
}