part of 'login_cubit.dart';

enum EmailValidationError { empty, invalid }

class EmailInput extends FormzInput<String, EmailValidationError> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String value) {
    if (value.trim().isEmpty) {
      return EmailValidationError.empty;
    }

    if (!Validators.isValidEmail(value)) {
      return EmailValidationError.invalid;
    }

    return null;
  }
}

enum PasswordValidationError { empty, short }

class PasswordInput extends FormzInput<String, PasswordValidationError> {
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value.trim().isEmpty) {
      return PasswordValidationError.empty;
    }

    if (!Validators.hasMinLength(value, 8)) {
      return PasswordValidationError.short;
    }

    return null;
  }
}

class LoginState extends Equatable {
  const LoginState({
    required this.email,
    required this.password,
    required this.isValid,
    required this.isPasswordObscured,
    required this.status,
    this.errorMessage,
    this.session,
  });

  factory LoginState.initial() {
    const email = EmailInput.dirty('demo@template.dev');
    const password = PasswordInput.dirty('Password123');
    return LoginState(
      email: email,
      password: password,
      isValid: Formz.validate([email, password]),
      isPasswordObscured: true,
      status: FormzSubmissionStatus.initial,
    );
  }

  final EmailInput email;
  final PasswordInput password;
  final bool isValid;
  final bool isPasswordObscured;
  final FormzSubmissionStatus status;
  final String? errorMessage;
  final AuthSession? session;

  LoginState copyWith({
    EmailInput? email,
    PasswordInput? password,
    bool? isValid,
    bool? isPasswordObscured,
    FormzSubmissionStatus? status,
    String? errorMessage,
    AuthSession? session,
    bool clearError = false,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      status: status ?? this.status,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      session: session ?? this.session,
    );
  }

  String? get emailError {
    if (!email.isValid && email.isNotValid) {
      switch (email.displayError) {
        case EmailValidationError.empty:
          return 'Email is required';
        case EmailValidationError.invalid:
          return 'Enter a valid email';
        case null:
          return null;
      }
    }

    return null;
  }

  String? get passwordError {
    if (!password.isValid && password.isNotValid) {
      switch (password.displayError) {
        case PasswordValidationError.empty:
          return 'Password is required';
        case PasswordValidationError.short:
          return 'Password must be at least 8 characters';
        case null:
          return null;
      }
    }

    return null;
  }

  @override
  List<Object?> get props => [
    email,
    password,
    isValid,
    isPasswordObscured,
    status,
    errorMessage,
    session,
  ];
}
