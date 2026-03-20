import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/complete_onboarding_usecase.dart';
import '../../domain/usecases/get_onboarding_status_usecase.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit({
    required CompleteOnboardingUseCase completeOnboardingUseCase,
    required GetOnboardingStatusUseCase getOnboardingStatusUseCase,
  }) : _completeOnboardingUseCase = completeOnboardingUseCase,
       _getOnboardingStatusUseCase = getOnboardingStatusUseCase,
       super(const OnboardingState.initial());

  final CompleteOnboardingUseCase _completeOnboardingUseCase;
  final GetOnboardingStatusUseCase _getOnboardingStatusUseCase;

  Future<void> bootstrap() async {
    emit(
      state.copyWith(
        status: OnboardingStatus.loading,
        isSubmitting: false,
        clearError: true,
      ),
    );

    final result = await _getOnboardingStatusUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: OnboardingStatus.pending,
          errorMessage: failure.message,
          isSubmitting: false,
        ),
      ),
      (isCompleted) => emit(
        state.copyWith(
          status: isCompleted
              ? OnboardingStatus.completed
              : OnboardingStatus.pending,
          isSubmitting: false,
          clearError: true,
        ),
      ),
    );
  }

  Future<void> complete() async {
    if (state.isSubmitting || state.status == OnboardingStatus.completed) {
      return;
    }

    emit(state.copyWith(isSubmitting: true, clearError: true));
    final result = await _completeOnboardingUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: OnboardingStatus.pending,
          errorMessage: failure.message,
          isSubmitting: false,
        ),
      ),
      (_) => emit(
        state.copyWith(
          status: OnboardingStatus.completed,
          isSubmitting: false,
          clearError: true,
        ),
      ),
    );
  }

  void handleBootstrapTimeout() {
    if (state.status == OnboardingStatus.loading || state.status == OnboardingStatus.initial) {
      emit(const OnboardingState(
        status: OnboardingStatus.pending,
        isSubmitting: false,
      ));
    }
  }
}
