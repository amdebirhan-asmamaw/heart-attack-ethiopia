import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../domain/entities/auth_session.dart';
import '../../domain/usecases/signup_usecase.dart';
import 'login_cubit.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required SignupUseCase signupUseCase})
    : _signupUseCase = signupUseCase,
      super(SignupState.initial());

  final SignupUseCase _signupUseCase;

  void firstNameChanged(String value) {
    final firstName = NameInput.dirty(value);
    emit(
      state.copyWith(
        firstName: firstName,
        isValid: Formz.validate([
          firstName,
          state.lastName,
          state.password,
          state.confirmPassword,
        ]),
      ),
    );
  }

  void lastNameChanged(String value) {
    final lastName = NameInput.dirty(value);
    emit(
      state.copyWith(
        lastName: lastName,
        isValid: Formz.validate([
          state.firstName,
          lastName,
          state.password,
          state.confirmPassword,
        ]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = PasswordInput.dirty(value);
    final confirmPassword = ConfirmPasswordInput.dirty(
      password: password.value,
      value: state.confirmPassword.value,
    );
    emit(
      state.copyWith(
        password: password,
        confirmPassword: confirmPassword,
        isValid: Formz.validate([
          state.firstName,
          state.lastName,
          password,
          confirmPassword,
        ]),
      ),
    );
  }

  void confirmPasswordChanged(String value) {
    final confirmPassword = ConfirmPasswordInput.dirty(
      password: state.password.value,
      value: value,
    );
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        isValid: Formz.validate([
          state.firstName,
          state.lastName,
          state.password,
          confirmPassword,
        ]),
      ),
    );
  }

  Future<void> submit() async {
    final firstName = NameInput.dirty(state.firstName.value);
    final lastName = NameInput.dirty(state.lastName.value);
    final password = PasswordInput.dirty(state.password.value);
    final confirmPassword = ConfirmPasswordInput.dirty(
      password: password.value,
      value: state.confirmPassword.value,
    );

    final isValid = Formz.validate([
      firstName,
      lastName,
      password,
      confirmPassword,
    ]);

    emit(
      state.copyWith(
        firstName: firstName,
        lastName: lastName,
        password: password,
        confirmPassword: confirmPassword,
        isValid: isValid,
      ),
    );

    if (!isValid) {
      return;
    }

    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        clearError: true,
      ),
    );

    final result = await _signupUseCase(
      firstName: firstName.value.trim(),
      lastName: lastName.value.trim(),
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
