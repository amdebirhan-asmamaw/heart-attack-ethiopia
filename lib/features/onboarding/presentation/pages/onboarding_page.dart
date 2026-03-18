import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/localization/generated/strings.g.dart';
import '../../../../shared/widgets/app_button.dart';
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
  late final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _advanceOrComplete({
    required BuildContext context,
    required int totalSlides,
  }) async {
    if (_currentPage == totalSlides - 1) {
      await context.read<OnboardingCubit>().complete();
      return;
    }

    await _pageController.nextPage(
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final slides = [
      _OnboardingSlideData(
        icon: Icons.monitor_heart_outlined,
        accent: const Color(0xFFFFE1A8),
        title: context.t.strings.onboarding.welcomeTitle,
        body: context.t.strings.onboarding.welcomeBody,
      ),
      _OnboardingSlideData(
        icon: Icons.fact_check_outlined,
        accent: const Color(0xFFB7F0E4),
        title: context.t.strings.onboarding.trackTitle,
        body: context.t.strings.onboarding.trackBody,
      ),
      _OnboardingSlideData(
        icon: Icons.local_hospital_outlined,
        accent: const Color(0xFFFFC2C0),
        title: context.t.strings.onboarding.supportTitle,
        body: context.t.strings.onboarding.supportBody,
      ),
    ];

    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          context.showAppSnackBar(state.errorMessage!);
        }
      },
      builder: (context, state) {
        final isLastPage = _currentPage == slides.length - 1;

        return Scaffold(
          body: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF8FBFF),
                  Color(0xFFFDEFE7),
                  Color(0xFFE8F1FF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 720),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 20, 24, 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                context.t.strings.app.name,
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(color: AppColors.textPrimary),
                              ),
                            ),
                            TextButton(
                              onPressed: state.isSubmitting
                                  ? null
                                  : () => context
                                        .read<OnboardingCubit>()
                                        .complete(),
                              child: Text(context.t.strings.onboarding.skip),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          context.t.strings.onboarding.intro,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(color: AppColors.textSecondary),
                        ),
                        const SizedBox(height: 24),
                        Expanded(
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: slides.length,
                            onPageChanged: (index) {
                              setState(() {
                                _currentPage = index;
                              });
                            },
                            itemBuilder: (context, index) {
                              final slide = slides[index];
                              return _OnboardingCard(slide: slide);
                            },
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            for (var index = 0; index < slides.length; index++)
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 220),
                                margin: const EdgeInsetsDirectional.only(
                                  end: 10,
                                ),
                                height: 10,
                                width: _currentPage == index ? 30 : 10,
                                decoration: BoxDecoration(
                                  color: _currentPage == index
                                      ? AppColors.primary
                                      : AppColors.border,
                                  borderRadius: BorderRadius.circular(999),
                                ),
                              ),
                            const Spacer(),
                            SizedBox(
                              width: 180,
                              child: AppButton(
                                label: isLastPage
                                    ? context.t.strings.onboarding.getStarted
                                    : context.t.strings.onboarding.next,
                                isLoading: state.isSubmitting,
                                onPressed: () => _advanceOrComplete(
                                  context: context,
                                  totalSlides: slides.length,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _OnboardingCard extends StatelessWidget {
  const _OnboardingCard({required this.slide});

  final _OnboardingSlideData slide;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white, width: 1.4),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A14213D),
            blurRadius: 30,
            offset: Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: slide.accent,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(slide.icon, size: 36, color: AppColors.textPrimary),
          ),
          const SizedBox(height: 32),
          Text(
            slide.title,
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(height: 1.1),
          ),
          const SizedBox(height: 18),
          Text(
            slide.body,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F7FC),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                const Icon(Icons.favorite_border, color: AppColors.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    context.t.strings.app.tagline,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingSlideData {
  const _OnboardingSlideData({
    required this.icon,
    required this.accent,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final Color accent;
  final String title;
  final String body;
}
