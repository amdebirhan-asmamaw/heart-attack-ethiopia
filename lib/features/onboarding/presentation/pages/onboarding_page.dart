import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/localization/generated/strings.g.dart';
import '../../../../core/router/routes.dart';
import '../../../../app/resources/app_media.dart';
import '../../../auth/presentation/bloc/auth_cubit.dart';
import '../bloc/onboarding_cubit.dart';
import '../widgets/onboarding_bottom_sheet.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToPage(int index) {
    if (index >= 2) return;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _goToNextRoute() {
    final authStatus = context.read<AuthCubit>().state.status;
    final nextRoute = authStatus == AuthStatus.authenticated
        ? AppRoutes.shell
        : AppRoutes.login;

    context.go(nextRoute);
  }

  Future<void> _completeOnboarding() async {
    final onboardingCubit = context.read<OnboardingCubit>();
    await onboardingCubit.complete();

    if (!mounted) {
      return;
    }

    if (onboardingCubit.state.status == OnboardingStatus.completed) {
      _goToNextRoute();
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t.strings.onboarding;

    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state.status == OnboardingStatus.completed) {
          _goToNextRoute();
          return;
        }

        if (state.errorMessage != null) {
          context.showAppSnackBar(state.errorMessage!);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              // Static Background Image
              Positioned.fill(
                child: Image.asset(
                  AppMedia.onboardingBackground,
                  fit: BoxFit.cover,
                ),
              ),

              // Subtle top shadow on the background image only
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 180,
                child: IgnorePointer(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.18),
                          Colors.black.withValues(alpha: 0.08),
                          Colors.transparent,
                        ],
                        stops: [0, 0.45, 1],
                      ),
                    ),
                  ),
                ),
              ),

              // Static Logo
              Center(
                child: Transform.translate(
                  offset: const Offset(-0.5, -151.5),
                  child: Image.asset(
                    AppMedia.onboardingLogoPng,
                    width: 225,
                    height: 225,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // PageView for Onboarding Flow
              PageView(
                controller: _pageController,
                physics: const ClampingScrollPhysics(),
                children: [
                  // Page 1: White Card
                  OnboardingBottomSheet(
                    title: t.title3,
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    currentPage: 0,
                    indicatorInactiveColor: Colors.black,
                    onIndicatorTap: _navigateToPage,
                    buttonText: t.next,
                    buttonBackgroundColor: Colors.black,
                    buttonTextColor: Colors.white,
                    onButtonPressed: () => _navigateToPage(1),
                  ),

                  // Page 2: Dark Green Card
                  OnboardingBottomSheet(
                    title: t.title,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    currentPage: 1,
                    indicatorInactiveColor: Colors.white,
                    onIndicatorTap: _navigateToPage,
                    buttonText: 'Continue',
                    buttonBackgroundColor: Colors.white,
                    buttonTextColor: Colors.black,
                    onButtonPressed: _completeOnboarding,
                    isButtonLoading: state.isSubmitting,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
