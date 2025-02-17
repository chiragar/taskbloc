# Task List

Task List is a Flutter-based To-Do Application that allows users to add, update, delete, and view tasks in a date-wise manner. The app is built using BLoC for state management, GetIt for dependency injection, Go Router for navigation, and Dio for API handling.
*Note: More Feature and design update coming soon.......
Features

🗂 CRUD Operations (Create, Read, Update, Delete tasks)

📅 Date-wise Task Filtering (Tasks are shown based on selected dates)

✅ Pending & Completed Task Separation

🛠 State Management: BLoC Pattern

🏗 Dependency Injection: GetIt

🛤 Navigation: Go Router

🌐 Local Database: Hive for persistent storage

🎨 Smooth UI with Date Picker Slider

Tech Stack

Framework: Flutter

State Management: BLoC

Dependency Injection: GetIt

Navigation: Go Router

Database: Hive

Networking: Dio

Installation

Clone the Repository

git clone https://github.com/yourusername/task-list.git
cd task-list

Install Dependencies

flutter pub get

Run the App

flutter run

Folder Structure

lib/
│── logic/               # BLoC for state management
│── core/
│   ├── di/             # Dependency Injection setup (GetIt)
│   ├── router/         # Navigation setup (Go Router)
│   ├── constant/       # Constant Add(Color,TextStyle)
│   ├── theme/          # For Theme Handling
│── data/
│   ├── models/        # Task model (Hive-based)
│   ├── source/local/  # Local data storage using Hive
│   ├── repository/    # For Handling Data
│── Presentation/      
│   ├── pages/          # UI screens
│   ├── widget/          # Reusable UI components
└── main.dart         # App entry point

Usage

Add Task: Click on the + button to add a new task.

Update Task: Tap on an existing task to edit it.

Delete Task: Click the delete icon to remove a task.

Filter by Date: Use the date slider to filter tasks based on the selected date.

Dependencies

dependencies:
flutter:
sdk: flutter
flutter_bloc: 
get_it: 
go_router: 
dio: 
hive: 
hive_flutter:
date_picker_timeline:

License

This project is licensed under the MIT License.

Contributing

Feel free to fork the repository and make improvements. Pull requests are welcome! 🎉

Made with ❤️ using Flutter