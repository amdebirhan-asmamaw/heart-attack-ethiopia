import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/auth_session.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/restore_session_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required LogoutUseCase logoutUseCase,
    required RestoreSessionUseCase restoreSessionUseCase,
  }) : _logoutUseCase = logoutUseCase,
       _restoreSessionUseCase = restoreSessionUseCase,
       super(const AuthState.initial());

  final LogoutUseCase _logoutUseCase;
  final RestoreSessionUseCase _restoreSessionUseCase;

  Future<void> bootstrap() async {
    emit(state.copyWith(status: AuthStatus.loading, clearError: true));

    final result = await _restoreSessionUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AuthStatus.unauthenticated,
          errorMessage: failure.message,
          clearSession: true,
        ),
      ),
      (session) => emit(
        state.copyWith(
          status: AuthStatus.authenticated,
          session: session,
          clearError: true,
        ),
      ),
    );
  }

  void applySession(AuthSession session) {
    emit(
      state.copyWith(
        status: AuthStatus.authenticated,
        session: session,
        clearError: true,
      ),
    );
  }

  Future<void> logout() async {
    emit(state.copyWith(status: AuthStatus.loading, clearError: true));
    final result = await _logoutUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AuthStatus.unauthenticated,
          errorMessage: failure.message,
          clearSession: true,
        ),
      ),
      (_) => emit(const AuthState(status: AuthStatus.unauthenticated)),
    );
  }

  void handleBootstrapTimeout() {
    if (state.status == AuthStatus.loading || state.status == AuthStatus.initial) {
      emit(const AuthState(status: AuthStatus.unauthenticated));
    }
  }
}
