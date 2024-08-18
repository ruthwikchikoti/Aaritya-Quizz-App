package models

type Question struct {
    ID          int      `json:"id"`
    Question    string   `json:"question"`
    Answers     []string `json:"answers"`
    Correct     int      `json:"correct"`
    Hint        string   `json:"hint"`
    Explanation string   `json:"explanation"`
}