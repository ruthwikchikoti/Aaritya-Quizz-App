**video link** : https://drive.google.com/file/d/14lHycmAnbNvkobKRhjdR33cFhQS-eM7q/view?usp=sharing

# Quiz App

This is a Flutter-based quiz application that allows users to test their knowledge on various topics. The app features multiple-choice questions, provides feedback on correct and incorrect answers, and displays the final score at the end of the quiz.

## Features

- **Multiple Choice Questions:** Users can answer a series of multiple-choice questions.
- **Hint and Explanation:** Each question includes a hint that can be shown or hidden. Explanations are available after answering, which users can choose to view.
- **Score Tracking:** The app keeps track of the user's score throughout the quiz.
- **Timer:** Each question has a time limit, adding a challenge to the quiz.
- **User Feedback:** Correct answers are highlighted in green, and incorrect answers in red, with a pop-up dialog providing immediate feedback.
- **Submit Button:** Users must click a "Submit" button to check their answer, giving them control over when to see the result.
- **Final Score Display:** At the end of the quiz, the user's final score is displayed along with a message that varies based on their performance.
- **Restart Quiz:** After completing the quiz, users can restart it to try again.

## Getting Started

### Prerequisites

- Flutter SDK installed on your machine.
- A code editor (e.g., VS Code, Android Studio).

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/ruthwikchikoti/Aaritya-Quizz-App.git
    ```
2. Navigate to the project directory:
    ```bash
    cd quiz-app
    ```
3. Install the dependencies:
    ```bash
    flutter pub get
    ```
4. Run the app:
    ```bash
    flutter run
    ```

## Project Structure

- **lib/**
  - `main.dart`: The entry point of the application.
  - `screens/`: Contains the different screens of the app (e.g., QuizScreen, ResultScreen).
  - `widgets/`: Reusable components like the question widget, progress bar, etc.
  - `models/`: Data models used in the app (e.g., Question).
  - `utils/`: Utility classes, such as API service for fetching questions.

## How It Works

1. **Starting the Quiz:** The user clicks the "Start Quiz" button, and the app fetches a series of questions from an API.
2. **Answering Questions:** For each question, the user selects an answer and clicks the "Submit" button to see if they are correct.
3. **Viewing Feedback:** A pop-up dialog appears to indicate whether the selected answer was correct or incorrect.
4. **Navigating Through Questions:** After viewing the feedback, the user can proceed to the next question. On the last question, a "Continue" button appears, leading to the result screen.
5. **Viewing Results:** The final score is displayed, along with a motivational message based on the user's performance.
6. **Retrying the Quiz:** The user can click the "Try Again" button to restart the quiz.


