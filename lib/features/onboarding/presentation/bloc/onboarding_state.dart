part of 'onboarding_cubit.dart';

enum OnboardingStatus { initial, loading, pending, completed }

class OnboardingState {
  const OnboardingState({
    required this.status,
    required this.isSubmitting,
    this.errorMessage,
  });

  const OnboardingState.initial()
    : status = OnboardingStatus.initial,
      isSubmitting = false,
      errorMessage = null;

  final OnboardingStatus status;
  final bool isSubmitting;
  final String? errorMessage;

  OnboardingState copyWith({
    OnboardingStatus? status,
    bool? isSubmitting,
    String? errorMessage,
    bool clearError = false,
  }) {
    return OnboardingState(
      status: status ?? this.status,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}
