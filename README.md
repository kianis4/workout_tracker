# Workout Tracker

A comprehensive Flutter application designed to track progressive overload in weight lifting exercises, helping users monitor and improve their strength training performance.

![App Banner](assets/images/app_banner.png)

## Overview

Workout Tracker is a cross-platform fitness application built with Flutter that allows weightlifters and fitness enthusiasts to record their workouts, track progressive overload, and visualize performance improvements over time. The app emphasizes data-driven strength training for optimal muscle growth and performance gains.

## Features

- **Exercise Library**: Store and manage a comprehensive collection of exercises
- **Workout Sessions**: Create and customize workout routines
- **Progressive Overload Tracking**: Monitor weight increases, additional reps, and volume progression
- **Performance Analytics**: Visualize strength gains and workout consistency  
- **Rest Timer**: Built-in customizable timer for rest periods between sets
- **Personal Records**: Automatic tracking and celebration of new PRs
- **Cross-Platform Support**: Available on iOS, Android, macOS, Windows, Linux, and Web

## Technology Stack

- **Framework**: Flutter SDK with null safety and Material 3 support
- **Programming Language**: Dart 3.0+ with strong typing and modern language features
- **State Management**: BLoC pattern with flutter_bloc for reactive UI updates and predictable state transitions
- **Database**: Firebase Firestore for cloud storage with local persistence using Hive for offline capability
- **Architecture**: Clean Architecture with separation of concerns (data, domain, presentation layers)
- **UI Components**: Material Design 3 widgets with responsive layouts for all form factors
- **Authentication**: Firebase Authentication with social sign-in options
- **Analytics**: Firebase Analytics for user behavior tracking and conversion optimization
- **Testing**: Unit tests with mockito, widget tests, and integration tests with >80% coverage
- **CI/CD**: GitHub Actions for automated testing, building, and deployment
- **Code Quality**: Static analysis with flutter_lints and continuous code quality monitoring
- **Platform Support**:
  - Mobile: iOS (Swift), Android (Kotlin) with native channel integration
  - Desktop: Windows, macOS, Linux with platform-specific optimizations
  - Web: Progressive Web App with service workers and offline support

## Installation

### Prerequisites

- Flutter SDK (Version 3.0+)
- Dart (Version 2.17+)
- Git
- Android Studio / XCode (for mobile development)
- VS Code or other IDE with Flutter extensions

### Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/workout_tracker.git
   cd workout_tracker
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run
   ```

### Platform-Specific Builds

#### Android
```bash
flutter build apk --release
```

#### iOS
```bash
flutter build ios --release
```

#### macOS
```bash
flutter build macos --release
```

#### Windows
```bash
flutter build windows --release
```

#### Linux
```bash
flutter build linux --release
```

#### Web
```bash
flutter build web --release
```

## Project Structure

The application follows an organized structure optimized for scalability and maintainability:

```
workout_tracker/
├── android/                 # Android platform-specific code
│   ├── app/                 # Android app configuration
│   │   └── src/main/        # Java/Kotlin source files
│   │       └── java/io/flutter/app/  # Flutter integration code
├── ios/                     # iOS platform-specific code
│   ├── Runner/              # Swift app delegate and configuration
│   └── Podfile              # iOS dependencies
├── linux/                   # Linux platform-specific code
│   ├── flutter/             # Flutter engine plugin registration
│   ├── main.cc              # Application entry point
│   └── my_application.cc    # GTK application implementation
├── macos/                   # macOS platform-specific code
│   ├── Flutter/             # Plugin registrant for macOS
│   ├── Runner/              # MainFlutterWindow and AppDelegate
│   └── Podfile              # macOS dependencies
├── windows/                 # Windows platform-specific code
│   ├── flutter/             # Plugin registrant
│   └── runner/              # Win32Window implementation with Flutter integration
│       ├── flutter_window.cpp  # Flutter window controller
│       ├── win32_window.cpp    # Platform window implementation
│       └── main.cpp            # Application entry point
├── web/                     # Web platform configuration
│   ├── index.html           # HTML entry point with Flutter initialization
│   └── manifest.json        # Progressive Web App configuration
├── lib/                     # Main Dart code
│   ├── core/                # Core functionality and utilities
│   │   ├── constants/       # Application-wide constants
│   │   ├── errors/          # Error handling and exceptions
│   │   └── utils/           # Utility functions and helpers
│   ├── data/                # Data layer (repositories, data sources)
│   │   ├── models/          # Data models/entities for Firebase
│   │   ├── repositories/    # Repository implementations
│   │   └── sources/         # Data sources (Firestore, local storage)
│   ├── domain/              # Domain layer (use cases, entities)
│   │   ├── entities/        # Core business entities
│   │   ├── repositories/    # Repository interfaces
│   │   └── usecases/        # Business logic use cases
│   ├── presentation/        # Presentation layer (UI, BLoC)
│   │   ├── blocs/           # BLoC state management
│   │   ├── pages/           # Screen/page widgets
│   │   ├── widgets/         # Reusable UI components
│   │   └── themes/          # Application theming
│   └── firebase/            # Firebase configuration and services
│       ├── auth/            # Firebase Authentication implementation
│       ├── firestore/       # Firestore database integration
│       └── analytics/       # Firebase Analytics integration
├── test/                    # Testing directory
│   ├── unit/                # Unit tests for business logic
│   ├── widget/              # Widget testing
│   └── integration/         # End-to-end testing
├── assets/                  # Static assets
│   └── images/              # Image assets including app_banner.png
├── pubspec.yaml             # Project dependencies (Firebase, BLoC, etc.)
└── .gitignore               # Git ignore configuration
```

### Architectural Details

#### Clean Architecture

The application implements Clean Architecture with three main layers:

1. **Data Layer**: Handles data operations and external services
   - Firebase integrations (Firestore, Authentication, Analytics)
   - Repository implementations that fetch and persist data
   - Data models that map to/from Firestore documents

2. **Domain Layer**: Contains business logic independent of UI or external services
   - Business entities representing core concepts (Exercises, Workouts, Sets)
   - Use cases that encapsulate specific business operations
   - Repository interfaces defining the contract for data operations

3. **Presentation Layer**: Manages UI components and state
   - BLoC pattern for state management with event-driven architecture
   - Material Design 3 components for consistent UI across platforms
   - Platform-specific optimizations for different form factors

#### Platform-Specific Implementation

- **Windows**: Uses Win32 window implementation with custom Flutter window controller
  - The application handles window resizing, DPI scaling, and theme changes
  - Native plugin integration for Firebase services

- **macOS**: Leverages Cocoa APIs with FlutterViewController integration
  - MainFlutterWindow class handles window management
  - Native Firebase plugin registration through GeneratedPluginRegistrant

- **Linux**: Implements GTK application with Flutter view integration
  - Handles window decoration variants (header bar based on environment)
  - Manages command-line arguments for Flutter engine

- **Mobile/Web**: Standard Flutter implementations with platform-specific optimizations

#### Cross-Platform Firebase Integration

Firebase services are integrated via the following plugins:
- `firebase_core` (^2.27.0): Core Firebase functionality
- `firebase_auth` (^4.17.8): Authentication services
- `cloud_firestore` (^4.15.8): Cloud database
- `firebase_database` (^10.4.9): Realtime database

These are registered appropriately for each platform via the respective plugin registrant files.

### Build and Deployment

The project uses platform-specific build commands as listed in the Installation section, with the configuration managed through:
- Flutter's build system for compiling to target platforms
- GitHub Actions for CI/CD automation
- Firebase hosting for web deployment
