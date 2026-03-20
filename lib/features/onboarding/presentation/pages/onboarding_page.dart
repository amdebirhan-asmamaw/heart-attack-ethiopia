import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/resources/app_media.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/localization/generated/strings.g.dart';
import '../../../../core/router/routes.dart';
import '../../../auth/presentation/bloc/auth_cubit.dart';
import '../bloc/onboarding_cubit.dart';
import '../widgets/onboarding_bottom_sheet.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _pageController;
  late final List<_OnboardingStep> _steps;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _steps = const [_OnboardingStep.story, _OnboardingStep.welcome];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToPage(int index) {
    if (index < 0 || index >= _steps.length) {
      return;
    }

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _completeOnboarding() async {
    await context.read<OnboardingCubit>().complete();
  }

  void _goToNextRoute() {
    final authStatus = context.read<AuthCubit>().state.status;
    final nextRoute = authStatus == AuthStatus.authenticated
        ? AppRoutes.shell
        : AppRoutes.login;

    context.go(nextRoute);
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t.strings.onboarding;

    return BlocListener<OnboardingCubit, OnboardingState>(
      listenWhen: (previous, current) =>
          previous.status != current.status ||
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        if (state.status == OnboardingStatus.completed) {
          _goToNextRoute();
          return;
        }

        if (state.errorMessage != null) {
          context.showAppSnackBar(state.errorMessage!);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                AppMedia.onboardingBackground,
                fit: BoxFit.cover,
              ),
            ),
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 180,
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x2E000000),
                        Color(0x14000000),
                        Colors.transparent,
                      ],
                      stops: [0, 0.45, 1],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Image.asset(
                  AppMedia.onboardingLogoPng,
                  width: 225,
                  height: 225,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            PageView(
              controller: _pageController,
              physics: const ClampingScrollPhysics(),
              children: _steps
                  .asMap()
                  .entries
                  .map(
                    (entry) => _buildStep(
                      context,
                      step: entry.value,
                      pageIndex: entry.key,
                      onboardingText: t,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(
    BuildContext context, {
    required _OnboardingStep step,
    required int pageIndex,
    required TranslationsStringsOnboardingEn onboardingText,
  }) {
    switch (step) {
      case _OnboardingStep.story:
        return OnboardingBottomSheet(
          title: onboardingText.title3,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          currentPage: pageIndex,
          indicatorInactiveColor: Colors.black,
          onIndicatorTap: _navigateToPage,
          buttonText: onboardingText.next,
          buttonBackgroundColor: Colors.black,
          buttonTextColor: Colors.white,
          onButtonPressed: () => _navigateToPage(pageIndex + 1),
        );
      case _OnboardingStep.welcome:
        return BlocSelector<OnboardingCubit, OnboardingState, bool>(
          selector: (state) => state.isSubmitting,
          builder: (context, isSubmitting) {
            return OnboardingBottomSheet(
              title: onboardingText.title,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              currentPage: pageIndex,
              indicatorInactiveColor: Colors.white,
              onIndicatorTap: _navigateToPage,
              buttonText: 'Continue',
              buttonBackgroundColor: Colors.white,
              buttonTextColor: Colors.black,
              onButtonPressed: _completeOnboarding,
              isButtonLoading: isSubmitting,
            );
          },
        );
    }
  }
}

enum _OnboardingStep { story, welcome }
