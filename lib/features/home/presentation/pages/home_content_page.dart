import 'package:flutter/material.dart';

import 'package:heart_attack_ethiopia/features/home/presentation/widgets/ai_assistant_card.dart';
import 'package:heart_attack_ethiopia/features/home/presentation/widgets/categories_section.dart';
import 'package:heart_attack_ethiopia/features/home/presentation/widgets/home_banner_card.dart';
import 'package:heart_attack_ethiopia/features/home/presentation/widgets/news_section.dart';
import 'package:heart_attack_ethiopia/features/home/presentation/widgets/resources_section.dart';

class HomeContentPage extends StatelessWidget {
  const HomeContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFFAFAFA),
      child: SafeArea(
        top: false,
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 112),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HomeBannerCard(),
              SizedBox(height: 32),
              CategoriesSection(),
              SizedBox(height: 28),
              AiAssistantCard(),
              SizedBox(height: 32),
              ResourcesSection(),
              SizedBox(height: 28),
              NewsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
