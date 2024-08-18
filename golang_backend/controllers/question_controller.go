package controllers

import (
  "encoding/json"
  "net/http"
  "golang_backend/services"
)

func GetQuestions(w http.ResponseWriter, r *http.Request) {
  questions := services.GetQuestions()
  w.Header().Set("Content-Type", "application/json")
  json.NewEncoder(w).Encode(questions)
}
