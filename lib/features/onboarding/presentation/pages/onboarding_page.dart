import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/localization/generated/strings.g.dart';
import '../../../../app/resources/app_media.dart';
import '../bloc/onboarding_cubit.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _OnboardingView();
  }
}

class _OnboardingView extends StatefulWidget {
  const _OnboardingView();

  @override
  State<_OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<_OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t.strings.onboarding;
    final pageTitles = [
      t.title3,
      t.title,
      t.title2,
    ];

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
              // Background Gradient (Frame 1000007007)
              // Using the CSS gradient as the full page background since images are for reference only
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

              // Logo (LOGO_3-removebg-preview 1)
              // CSS: left: calc(50% - 225px / 2 - 0.5px); top: calc(50% - 225px / 2 - 151.5px);
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

              // Bottom Sheet (Frame 1000007006)
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 254,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 26, left: 25, right: 25),
                    child: Column(
                      children: [
                        // PageView for Titles
                        Expanded(
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: pageTitles.length,
                            onPageChanged: (index) {
                              setState(() {
                                _currentPage = index;
                              });
                            },
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 313,
                                child: Text(
                                  pageTitles[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        
                        // Indicators (Frame 512564)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(pageTitles.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 1.5),
                              child: _buildIndicator(isActive: _currentPage == index),
                            );
                          }),
                        ),
                        
                        const SizedBox(height: 20),

                        // Sign Up Button
                        SizedBox(
                          width: 310,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_currentPage < pageTitles.length - 1) {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                context.read<OnboardingCubit>().complete();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 0,
                              padding: EdgeInsets.zero,
                            ),
                            child: state.isSubmitting
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text(
                                    _currentPage == pageTitles.length - 1
                                        ? t.signUp
                                        : t.next,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      height: 1.4,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 20), // Bottom padding
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIndicator({required bool isActive}) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? AppColors.onboardingRed : Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
