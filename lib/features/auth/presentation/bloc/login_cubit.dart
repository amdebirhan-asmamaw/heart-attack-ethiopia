import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required LoginUseCase loginUseCase})
    : _loginUseCase = loginUseCase,
      super(LoginState.initial());

  final LoginUseCase _loginUseCase;

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
  }

  Future<void> submit({required String email, required String password}) async {
    if (state.status == LoginSubmissionStatus.inProgress) {
      return;
    }

    emit(
      state.copyWith(
        status: LoginSubmissionStatus.inProgress,
        clearError: true,
      ),
    );

    final result = await _loginUseCase(email: email.trim(), password: password);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: LoginSubmissionStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (session) => emit(
        state.copyWith(
          status: LoginSubmissionStatus.success,
          session: session,
          clearError: true,
        ),
      ),
    );
  }
}
