part of 'login_cubit.dart';

enum LoginSubmissionStatus { initial, inProgress, success, failure }

class LoginState extends Equatable {
  const LoginState({
    required this.isPasswordObscured,
    required this.status,
    this.errorMessage,
    this.session,
  });

  factory LoginState.initial() {
    return const LoginState(
      isPasswordObscured: true,
      status: LoginSubmissionStatus.initial,
    );
  }

  final bool isPasswordObscured;
  final LoginSubmissionStatus status;
  final String? errorMessage;
  final AuthSession? session;

  LoginState copyWith({
    bool? isPasswordObscured,
    LoginSubmissionStatus? status,
    String? errorMessage,
    AuthSession? session,
    bool clearError = false,
  }) {
    return LoginState(
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      status: status ?? this.status,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      session: session ?? this.session,
    );
  }

  @override
  List<Object?> get props => [
    isPasswordObscured,
    status,
    errorMessage,
    session,
  ];
}
