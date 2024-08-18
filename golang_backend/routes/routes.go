package routes

import (
    "golang_backend/controllers"

    "github.com/gorilla/mux"
)

func SetupRouter() *mux.Router {
    router := mux.NewRouter()
    router.HandleFunc("/questions", controllers.GetQuestions).Methods("GET")
    return router
}