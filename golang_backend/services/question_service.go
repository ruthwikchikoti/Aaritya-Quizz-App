package services

import "golang_backend/models"

func GetQuestions() []models.Question {
    return []models.Question{
        {
            ID:          1,
            Question:    "What is the output of 2 + 2?",
            Answers:     []string{"3", "4", "5", "6"},
            Correct:     1,
            Hint:        "Think about basic addition.",
            Explanation: "2 + 2 is a simple addition problem that equals 4.",
        },
        {
            ID:          2,
            Question:    "What is the time complexity of binary search?",
            Answers:     []string{"O(n)", "O(log n)", "O(n^2)", "O(1)"},
            Correct:     1,
            Hint:        "Consider how the search space is reduced in each step.",
            Explanation: "Binary search reduces the search space by half in each step, resulting in a logarithmic time complexity of O(log n).",
        },
        {
            ID:          3,
            Question:    "Which of these is a sorting algorithm?",
            Answers:     []string{"BFS", "DFS", "Merge Sort", "Dijkstra's"},
            Correct:     2,
            Hint:        "Look for an algorithm that arranges elements in a specific order.",
            Explanation: "Merge Sort is a divide-and-conquer sorting algorithm that efficiently sorts an array or list.",
        },
        {
            ID:          4,
            Question:    "What does API stand for?",
            Answers:     []string{"Application Programming Interface", "Application Process Integration", "Advanced Programming Interface", "Automated Programming Interface"},
            Correct:     0,
            Hint:        "It's a set of protocols for building and integrating application software.",
            Explanation: "API stands for Application Programming Interface. It defines how software components should interact.",
        },
        {
            ID:          5,
            Question:    "Which language is known as a scripting language?",
            Answers:     []string{"Java", "C++", "Python", "C#"},
            Correct:     2,
            Hint:        "This language is often used for automation and rapid prototyping.",
            Explanation: "Python is widely known as a scripting language due to its interpreted nature and ease of use for quick scripts and automation tasks.",
        },
        {
            ID:          6,
            Question:    "What is the primary use of Git?",
            Answers:     []string{"Version control", "Database management", "Server configuration", "Front-end development"},
            Correct:     0,
            Hint:        "It helps track changes in source code during software development.",
            Explanation: "Git is a distributed version control system used to track changes in source code, allowing multiple developers to work together on non-linear development.",
        },
        {
            ID:          7,
            Question:    "What does HTTP stand for?",
            Answers:     []string{"HyperText Transfer Protocol", "HyperText Transport Protocol", "Hyper Transfer Text Protocol", "Hyper Transfer Transport Protocol"},
            Correct:     0,
            Hint:        "It's the foundation of data communication on the World Wide Web.",
            Explanation: "HTTP stands for HyperText Transfer Protocol. It's an application-layer protocol for transmitting hypermedia documents, such as HTML.",
        },
        {
            ID:          8,
            Question:    "Which of these is a NoSQL database?",
            Answers:     []string{"MySQL", "PostgreSQL", "MongoDB", "SQLite"},
            Correct:     2,
            Hint:        "Look for a database that doesn't use traditional table-based relational database structures.",
            Explanation: "MongoDB is a NoSQL database that uses a document-oriented model, storing data in flexible, JSON-like documents.",
        },
        {
            ID:          9,
            Question:    "In which language is the Linux kernel written?",
            Answers:     []string{"C", "C++", "Python", "Java"},
            Correct:     0,
            Hint:        "This language is known for its efficiency and low-level system access.",
            Explanation: "The Linux kernel is primarily written in C, which provides the necessary low-level control and efficiency for operating system development.",
        },
        {
            ID:          10,
            Question:    "What is the purpose of a constructor in a class?",
            Answers:     []string{"Initialize objects", "Destroy objects", "Allocate memory", "Optimize performance"},
            Correct:     0,
            Hint:        "It's called when creating a new instance of a class.",
            Explanation: "A constructor is a special method used to initialize objects. It's called automatically when a new instance of a class is created, setting initial values for object attributes.",
        },
    }
}