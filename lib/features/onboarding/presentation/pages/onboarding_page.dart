import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/localization/generated/strings.g.dart';
import '../../../../app/resources/app_media.dart';
import '../bloc/onboarding_cubit.dart';
import '../widgets/onboarding_bottom_sheet.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

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

  @override
  Widget build(BuildContext context) {
    final t = context.t.strings.onboarding;

    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          context.showAppSnackBar(state.errorMessage!);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              // Static Background Gradient
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.overlayGradientStart,
                        AppColors.overlayGradientEnd,
                      ],
                      stops: [0.0, 0.7965],
                    ),
                  ),
                ),
              ),

              // Static Logo
              Center(
                child: Transform.translate(
                  offset: const Offset(-0.5, -151.5),
                  child: Image.asset(
                    AppMedia.onboardingLogo,
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
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
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
                    backgroundColor: AppColors.onboardingGreen,
                    textColor: Colors.white,
                    currentPage: 1,
                    indicatorInactiveColor: Colors.white,
                    onIndicatorTap: _navigateToPage,
                    buttonText: t.signUp,
                    buttonBackgroundColor: Colors.white,
                    buttonTextColor: Colors.black,
                    onButtonPressed: () =>
                        context.read<OnboardingCubit>().complete(),
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
