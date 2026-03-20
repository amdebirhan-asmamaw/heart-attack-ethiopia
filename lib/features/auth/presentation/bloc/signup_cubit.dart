import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/auth_session.dart';
import '../../domain/usecases/signup_usecase.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required SignupUseCase signupUseCase})
    : _signupUseCase = signupUseCase,
      super(SignupState.initial());

  final SignupUseCase _signupUseCase;

  Future<void> submit({
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    if (state.status == SignupSubmissionStatus.inProgress) {
      return;
    }

    emit(
      state.copyWith(
        status: SignupSubmissionStatus.inProgress,
        clearError: true,
      ),
    );

    final result = await _signupUseCase(
      firstName: firstName.trim(),
      lastName: lastName.trim(),
      password: password,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: SignupSubmissionStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (session) => emit(
        state.copyWith(
          status: SignupSubmissionStatus.success,
          session: session,
          clearError: true,
        ),
      ),
    );
  }
}
