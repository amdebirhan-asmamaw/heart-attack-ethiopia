part of 'signup_cubit.dart';

enum SignupSubmissionStatus { initial, inProgress, success, failure }

class SignupState extends Equatable {
  const SignupState({required this.status, this.errorMessage, this.session});

  factory SignupState.initial() {
    return const SignupState(status: SignupSubmissionStatus.initial);
  }

  final SignupSubmissionStatus status;
  final String? errorMessage;
  final AuthSession? session;

  SignupState copyWith({
    bool? isPasswordObscured,
    bool? isConfirmPasswordObscured,
    SignupSubmissionStatus? status,
    String? errorMessage,
    AuthSession? session,
    bool clearError = false,
  }) {
    return SignupState(
      status: status ?? this.status,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      session: session ?? this.session,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, session];
}
