part of 'signup_cubit.dart';

enum NameValidationError { empty }

class NameInput extends FormzInput<String, NameValidationError> {
  const NameInput.pure() : super.pure('');
  const NameInput.dirty([super.value = '']) : super.dirty();

  @override
  NameValidationError? validator(String value) {
    return value.trim().isEmpty ? NameValidationError.empty : null;
  }
}

enum ConfirmPasswordValidationError { empty, mismatch }

class ConfirmPasswordInput
    extends FormzInput<String, ConfirmPasswordValidationError> {
  const ConfirmPasswordInput.pure({this.password = ''}) : super.pure('');
  const ConfirmPasswordInput.dirty({this.password = '', String value = ''})
    : super.dirty(value);

  final String password;

  @override
  ConfirmPasswordValidationError? validator(String value) {
    if (value.trim().isEmpty) {
      return ConfirmPasswordValidationError.empty;
    }
    return value == password ? null : ConfirmPasswordValidationError.mismatch;
  }
}

class SignupState extends Equatable {
  const SignupState({
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.confirmPassword,
    required this.isValid,
    required this.isPasswordObscured,
    required this.isConfirmPasswordObscured,
    required this.status,
    this.errorMessage,
    this.session,
  });

  factory SignupState.initial() {
    return const SignupState(
      firstName: NameInput.pure(),
      lastName: NameInput.pure(),
      password: PasswordInput.pure(),
      confirmPassword: ConfirmPasswordInput.pure(),
      isValid: false,
      isPasswordObscured: true,
      isConfirmPasswordObscured: true,
      status: FormzSubmissionStatus.initial,
    );
  }

  final NameInput firstName;
  final NameInput lastName;
  final PasswordInput password;
  final ConfirmPasswordInput confirmPassword;
  final bool isValid;
  final bool isPasswordObscured;
  final bool isConfirmPasswordObscured;
  final FormzSubmissionStatus status;
  final String? errorMessage;
  final AuthSession? session;

  SignupState copyWith({
    NameInput? firstName,
    NameInput? lastName,
    PasswordInput? password,
    ConfirmPasswordInput? confirmPassword,
    bool? isValid,
    bool? isPasswordObscured,
    bool? isConfirmPasswordObscured,
    FormzSubmissionStatus? status,
    String? errorMessage,
    AuthSession? session,
    bool clearError = false,
  }) {
    return SignupState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isValid: isValid ?? this.isValid,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      isConfirmPasswordObscured:
          isConfirmPasswordObscured ?? this.isConfirmPasswordObscured,
      status: status ?? this.status,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      session: session ?? this.session,
    );
  }

  String? get firstNameError {
    if (firstName.isPure) {
      return null;
    }

    return firstName.displayError == NameValidationError.empty
        ? 'First name is required'
        : null;
  }

  String? get lastNameError {
    if (lastName.isPure) {
      return null;
    }

    return lastName.displayError == NameValidationError.empty
        ? 'Last name is required'
        : null;
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

  String? get confirmPasswordError {
    if (!confirmPassword.isValid && confirmPassword.isNotValid) {
      switch (confirmPassword.displayError) {
        case ConfirmPasswordValidationError.empty:
          return 'Confirm password is required';
        case ConfirmPasswordValidationError.mismatch:
          return 'Passwords do not match';
        case null:
          return null;
      }
    }
    return null;
  }

  @override
  List<Object?> get props => [
    firstName,
    lastName,
    password,
    confirmPassword,
    isValid,
    isPasswordObscured,
    isConfirmPasswordObscured,
    status,
    errorMessage,
    session,
  ];
}
