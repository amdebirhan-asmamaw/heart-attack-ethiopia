import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../core/utils/validators.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required LoginUseCase loginUseCase})
    : _loginUseCase = loginUseCase,
      super(LoginState.initial());

  final LoginUseCase _loginUseCase;

  void emailChanged(String value) {
    final email = EmailInput.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = PasswordInput.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.email, password]),
      ),
    );
  }

  Future<void> submit() async {
    final email = EmailInput.dirty(state.email.value);
    final password = PasswordInput.dirty(state.password.value);
    final isValid = Formz.validate([email, password]);

    emit(state.copyWith(email: email, password: password, isValid: isValid));

    if (!isValid) {
      return;
    }

    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        clearError: true,
      ),
    );

    final result = await _loginUseCase(
      email: email.value.trim(),
      password: password.value,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (session) => emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
          session: session,
          clearError: true,
        ),
      ),
    );
  }
}
