# AGENTS.md - Heart Attack Ethiopia Flutter App

This document provides guidelines and instructions for AI agents working on this codebase.

## Project Overview

- **Type**: Flutter mobile application (Android/iOS)
- **State Management**: flutter_bloc (Cubit pattern)
- **Architecture**: Clean Architecture (features/data/domain/presentation)
- **DI**: get_it with injectable
- **Routing**: go_router
- **i18n**: slang

## Build/Lint/Test Commands

### Flutter Commands
```bash
# Run the app
flutter run
flutter run -d <device_id>          # Run on specific device

# Build
flutter build apk --debug            # Debug APK
flutter build apk --release          # Release APK
flutter build appbundle --release    # App Bundle

# Environment selection (uses .env files in assets)
--dart-define=FLUTTER_ENV=dev|staging|prod
```

### Linting & Analysis
```bash
flutter analyze                      # Run static analysis
flutter analyze lib/core/router     # Analyze specific directory
flutter analyze lib/features/auth    # Analyze specific feature

# Auto-fix issues
dart fix --apply                    # Apply automatic fixes
```

### Testing
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/app_guards_test.dart

# Run tests matching a pattern
flutter test --name "AppGuards"

# Run with coverage
flutter test --coverage
```

### Code Generation
```bash
# Run build_runner for freezed, injectable, retrofit, json_serializable
dart run build_runner build --delete-conflicting-outputs

# Regenerate localization strings
dart run slang
```

## Code Style Guidelines

### General
- Use 2 spaces for indentation (no tabs)
- Maximum line length: 80 characters (soft limit, up to 100 acceptable)
- Use `const` constructors whenever possible
- Avoid `var` when type can be inferred; prefer explicit types for public APIs

### Naming Conventions

| Element | Convention | Example |
|---------|------------|---------|
| Classes | PascalCase | `AuthCubit`, `OnboardingPage` |
| Files | snake_case | `auth_cubit.dart`, `onboarding_page.dart` |
| Private members | _camelCase | `_logoutUseCase`, `_userRepository` |
| Constants | camelCase | `kMaxRetries`, `defaultTimeout` |
| Enums | PascalCase | `AuthStatus`, `OnboardingStatus` |
| Enum values | camelCase | `AuthStatus.authenticated` |
| Packages | lowercase | `flutter_bloc`, `get_it` |

### Imports

Order imports by specificity (use `dart fix` to auto-organize):
1. `dart:` core libraries
2. `package:` third-party packages
3. `package:flutter/...`
4. Relative imports (core, features, shared)
5. Use `part` for generated state files (`part 'auth_state.dart';`)

```dart
// Good
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/login_usecase.dart';
import '../bloc/auth_state.dart';
```

### State Management (BLoC/Cubit)

**Cubit Pattern:**
```dart
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required LogoutUseCase logoutUseCase,
    required RestoreSessionUseCase restoreSessionUseCase,
  }) : _logoutUseCase = logoutUseCase,
       _restoreSessionUseCase = restoreSessionUseCase,
       super(const AuthState.initial());

  final LogoutUseCase _logoutUseCase;
  final RestoreSessionUseCase _restoreSessionUseCase;

  Future<void> logout() async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _logoutUseCase();
    result.fold(
      (failure) => emit(state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: failure.message,
      )),
      (_) => emit(const AuthState(status: AuthStatus.unauthenticated)),
    );
  }
}
```

**State Pattern** (using Equatable + Freezed-style copyWith):
- Use `copyWith` for immutable state updates
- Include `clearError: true` when resetting error state
- Use nullable fields with `clearSession` pattern for optional clearing

### Error Handling

```dart
// Use dartz Either for domain-level errors
final result = await _repository.someOperation();
result.fold(
  (failure) => emit(state.copyWith(
    status: ErrorState,
    errorMessage: failure.message,
  )),
  (data) => emit(state.copyWith(status: SuccessState, data: data)),
);
```

### Dependency Injection

Use `get_it` with the instance named `sl`:
```dart
final sl = GetIt.instance;

Future<void> configureDependencies(AppConfig appConfig) async {
  await sl.reset();
  
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(localDataSource: sl(), remoteDataSource: sl()),
  );
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerFactory(() => LoginCubit(loginUseCase: sl()));  // Factory for page-level cubits
}
```

### Project Structure

```
lib/
├── app/
│   ├── app.dart              # Root widget with MultiBlocProvider
│   ├── app_bloc_observer.dart
│   └── resources/
├── core/
│   ├── config/               # App configuration
│   ├── di/                   # Dependency injection
│   ├── localization/         # i18n (slang)
│   ├── network/              # Dio, interceptors, websockets
│   ├── router/               # go_router + guards
│   └── theme/                # AppTheme
├── features/
│   ├── auth/
│   │   ├── data/             # Data sources, repositories impl
│   │   ├── domain/           # Entities, repositories interface, use cases
│   │   └── presentation/     # Pages, blocs, widgets
│   ├── onboarding/
│   ├── chat/
│   ├── notifications/
│   ├── profile/
│   └── settings/
└── shared/
    └── bloc/                 # Shared cubits (connectivity, etc.)
```

### Route Guards

Route guards are in `lib/core/router/guards.dart`. They handle:
1. Onboarding status checks
2. Authentication status checks
3. Protected route redirects

### Localization (slang)

- Source files: `lib/core/localization/i18n/*.i18n.json`
- Generated: `lib/core/localization/generated/strings.g.dart`
- Usage: `context.t.strings.onboarding.title`

### Testing

- Use `flutter_test`
- Test file naming: `<feature>_test.dart`
- Group tests by function under `main()`:
```dart
void main() {
  group('AppGuards.redirect', () {
    test('keeps loading flows on splash', () {
      // Arrange
      final redirect = AppGuards.redirect(...);
      // Act & Assert
      expect(redirect, isNull);
    });
  });
}
```

### Key Files for Reference

- `lib/core/router/app_router.dart` - GoRouter configuration
- `lib/core/router/guards.dart` - Route guards
- `lib/core/di/injection.dart` - Dependency injection setup
- `lib/app/app.dart` - Root widget with providers
- `lib/features/auth/presentation/bloc/auth_cubit.dart` - Auth state management example

## TODO Comment Convention

```dart
// TODO: Remove this condition for production - [reason]
```
