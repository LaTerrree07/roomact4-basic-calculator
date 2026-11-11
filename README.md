# My Calculator

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=flat&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=flat&logo=dart&logoColor=white)
![Platforms](https://img.shields.io/badge/Platforms-Android%20%7C%20Web-0F766E.svg?style=flat)

A minimalist, responsive basic calculator built with Flutter focusing on state management using `StatefulWidget`, `TextEditingController`, and clean error handling.

## Features & Supported Operations

- **Addition (`+`)**: Computes the sum of two numbers.
- **Subtraction (`−`)**: Subtracts the second number from the first.
- **Multiplication (`×`)**: Computes the product of two numbers.
- **Division (`÷`)**: Divides the first number by the second with zero-division validation (`Cannot divide by zero`).
- **Input Validation**: Gracefully handles non-numeric or empty input (`Invalid input`).
- **Clear (`Clear`)**: Resets inputs, calculation labels, and result display to initial state.
- **Responsive Layout**: Designed for Android and Web with overflow protection.

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (v3.13+ or higher)
- Android Studio / VS Code with Flutter extension
- An Android device/emulator or modern web browser (Chrome / Edge)

### Basic Run Commands

```bash
# Fetch dependencies
flutter pub get

# Run on a connected Android device or emulator
flutter run

# Run in Chrome (Web)
flutter run -d chrome

# Run automated widget tests
flutter test

# Run static analysis
flutter analyze
```
