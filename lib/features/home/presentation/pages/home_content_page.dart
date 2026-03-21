import 'package:flutter/material.dart';
import 'package:heart_attack_ethiopia/features/home/presentation/widgets/home_banner_card.dart';
import 'package:heart_attack_ethiopia/features/home/presentation/widgets/categories_section.dart';
import 'package:heart_attack_ethiopia/features/home/presentation/widgets/ai_assistant_card.dart';
import 'package:heart_attack_ethiopia/features/home/presentation/widgets/resources_section.dart';
import 'package:heart_attack_ethiopia/features/home/presentation/widgets/news_section.dart';

class HomeContentPage extends StatelessWidget {
  const HomeContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFAFAFA),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const HomeBannerCard(),
            const SizedBox(height: 32),
            const CategoriesSection(),
            const SizedBox(height: 32),
            const AiAssistantCard(),
            const SizedBox(height: 32),
            const ResourcesSection(),
            const SizedBox(height: 32),
            const NewsSection(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
