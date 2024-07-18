---

# Comments App

The Comments App is a Flutter application designed for managing user authentication and displaying comments fetched from an external API. It utilizes Firebase for authentication and remote configuration, providing a seamless user experience.

## Features

- **Firebase Authentication:** Users can sign up and log in using their email and password.
- **Comments Feed:** Displays comments fetched from [JSONPlaceholder](https://jsonplaceholder.typicode.com/comments) API.
- **Email Masking:** Utilizes Firebase Remote Config to optionally mask user emails in the comments feed.
- **Form Validation:** Validates user inputs for signup and login forms.
- **State Management:** Implemented using Provider for efficient and scalable state management.

## Architecture

The project follows a structured architecture to maintain code quality and organization:

- **Folders Structure:**
  - **model:** Contains data models used throughout the app.
  - **view:** Contains UI screens such as `SignUpScreen`, `SignInScreen`, and `HomeScreen`.
  - **service:** Handles business logic and communication with external APIs (e.g., Firebase authentication and comment fetching).
  - **utils:** Houses utility classes and widgets used across the app, such as custom text fields.
  - **viewmodel:** Manages the app's state and business logic using the Provider package.

## Technologies Used

- **Flutter:** Framework for building natively compiled applications for mobile, web, and desktop from a single codebase.
- **Firebase:** Backend services including Authentication and Remote Config.
- **Provider:** State management solution for Flutter applications.

## Getting Started

To run the project locally:

1. Ensure you have Flutter installed. If not, follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install).
2. Clone this repository.
3. Navigate to the project directory and run `flutter pub get` to install dependencies.
4. Connect your device or emulator.
5. Run `flutter run` to start the application.



